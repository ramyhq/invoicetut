// Purpose: Main user interface for viewing invoices.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/daos/invoice_dao.dart';

import '../database/database.dart';

// Provider of db
final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());

// Provider لـ InvoiceDao
final invoiceDaoProvider = Provider<InvoiceDao>((ref) {
  final db = ref.watch(dbProvider);
  return InvoiceDao(db);
});

// Provider for the future of invoices
// Assuming Invoice type is available from '../database/database.dart'
final invoicesFutureProvider = FutureProvider<List<Invoice>>((ref) {
  final invoiceDao = ref.watch(invoiceDaoProvider);
  return invoiceDao.getAllInvoices(); // This returns a Future<List<Invoice>>
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key}); // Add default constructor

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the dedicated future provider for invoices
    final invoicesAsync = ref.watch(invoicesFutureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('الفواتير')),
      body: invoicesAsync.when(
        data:
            (invoices) => ListView.builder(
              itemCount: invoices.length,
              itemBuilder:
                  (_, index) => ListTile(
                    title: Text(invoices[index].customerName),
                    subtitle: Text('${invoices[index].total} \$'),
                  ),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('حدث خطأ: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addInvoice(ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addInvoice(WidgetRef ref) {
    final invoiceDao = ref.read(invoiceDaoProvider);
    invoiceDao.insertInvoice(
      InvoicesCompanion.insert(
        customerName: 'عميل جديد',
        total: 0.0, // Use double directly
      ),
    );
  }
}
