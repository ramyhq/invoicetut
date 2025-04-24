// Purpose: Main user interface for viewing invoices.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/daos/invoice_dao.dart';
import '../database/database.dart';
import 'package:intl/intl.dart' as intl;

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
      appBar: AppBar(
        title: const Text('Invoices'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(invoicesFutureProvider),
          ),
        ],
      ),
      body: invoicesAsync.when(
        data: (invoices) => invoices.isEmpty
            ? const Center(child: Text('No invoices yet'))
            : ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (_, index) => InvoiceListTile(invoice: invoices[index]),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) {
 
          return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $e'),
              TextButton(
                onPressed: () => ref.refresh(invoicesFutureProvider),
                child: const Text('Try Again'),
              ),
            ],
          ),
        );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddInvoiceDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddInvoiceDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AddInvoiceDialog(ref: ref),
    );
  }
}

class InvoiceListTile extends ConsumerWidget {
  final Invoice invoice;

  const InvoiceListTile({super.key, required this.invoice});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormat = intl.DateFormat('MMM dd, yyyy');
    
    return Dismissible(
      key: Key(invoice.id.toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        ref.read(invoiceDaoProvider).deleteInvoice(invoice.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invoice deleted')),
        );
      },
      child: ListTile(
        title: Text(invoice.customerName),
        subtitle: Text(dateFormat.format(invoice.date)),
        trailing: Text(
          '\$${invoice.total.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () => _showEditInvoiceDialog(context, ref),
      ),
    );
  }

  void _showEditInvoiceDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => EditInvoiceDialog(invoice: invoice, ref: ref),
    );
  }
}

class AddInvoiceDialog extends ConsumerStatefulWidget {
  final WidgetRef ref;

  const AddInvoiceDialog({super.key, required this.ref});

  @override
  _AddInvoiceDialogState createState() => _AddInvoiceDialogState();
}

class _AddInvoiceDialogState extends ConsumerState<AddInvoiceDialog> {
  final _formKey = GlobalKey<FormState>();
  final _customerNameController = TextEditingController();
  final _totalController = TextEditingController();

  @override
  void dispose() {
    _customerNameController.dispose();
    _totalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Invoice'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _customerNameController,
              decoration: const InputDecoration(labelText: 'Customer Name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a name' : null,
            ),
            TextFormField(
              controller: _totalController,
              decoration: const InputDecoration(labelText: 'Total Amount'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Please enter an amount';
                if (double.tryParse(value!) == null) return 'Please enter a valid number';
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _submitForm,
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final invoiceDao = widget.ref.read(invoiceDaoProvider);
      invoiceDao.insertInvoice(
        InvoicesCompanion.insert(
          customerName: _customerNameController.text,
          total: double.parse(_totalController.text),
        ),
      );
      Navigator.pop(context);
      widget.ref.refresh(invoicesFutureProvider);
    }
  }
}

class EditInvoiceDialog extends ConsumerStatefulWidget {
  final Invoice invoice;
  final WidgetRef ref;

  const EditInvoiceDialog({
    super.key,
    required this.invoice,
    required this.ref,
  });

  @override
  _EditInvoiceDialogState createState() => _EditInvoiceDialogState();
}

class _EditInvoiceDialogState extends ConsumerState<EditInvoiceDialog> {
  late final TextEditingController _customerNameController;
  late final TextEditingController _totalController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _customerNameController = TextEditingController(text: widget.invoice.customerName);
    _totalController = TextEditingController(text: widget.invoice.total.toString());
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _totalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Invoice'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _customerNameController,
              decoration: const InputDecoration(labelText: 'Customer Name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a name' : null,
            ),
            TextFormField(
              controller: _totalController,
              decoration: const InputDecoration(labelText: 'Total Amount'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Please enter an amount';
                if (double.tryParse(value!) == null) return 'Please enter a valid number';
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _submitForm,
          child: const Text('Save'),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final invoiceDao = widget.ref.read(invoiceDaoProvider);
      invoiceDao.updateInvoice(
        widget.invoice.copyWith(
          customerName: _customerNameController.text,
          total: double.parse(_totalController.text),
        ),
      );
      Navigator.pop(context);
      widget.ref.refresh(invoicesFutureProvider);
    }
  }
}
