import 'package:conerp/features/invoice/presentation/pages/add_invoice_page.dart';
import 'package:conerp/features/invoice/presentation/pages/edit_invoice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/invoice_provider.dart';

class InvoicePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoices = ref.watch(invoiceListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Invoices')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddInvoicePage()),
          ).then((shouldRefresh) {
            if (shouldRefresh == true) {
              ref.read(invoiceListProvider.notifier).fetchInvoices();
            }
          });
        },
        child: const Icon(Icons.add),
      ),

      body: invoices.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data:
            (list) => ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, i) {
                final invoice = list[i];
                return Dismissible(
                  key: ValueKey(invoice.id),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) async {
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('تأكيد الحذف'),
                            content: const Text(
                              'هل أنت متأكد أنك تريد حذف هذه الفاتورة؟',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('إلغاء'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('حذف'),
                              ),
                            ],
                          ),
                    );
                    return confirmed ?? false;
                  },
                  onDismissed: (_) async {
                    final result = await ref
                        .read(deleteInvoiceProvider)
                        .call(invoice.id);

                    result.fold(
                      (error) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('فشل الحذف: $error')),
                      ),
                      (_) {
                        ref
                            .read(invoiceListProvider.notifier)
                            .fetchInvoices(); // نحدث القائمة
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم حذف الفاتورة')),
                        );
                      },
                    );
                  },
                  child: ListTile(
                    title: Text(invoice.title),
                    subtitle: Text('Amount: ${invoice.amount}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        EditInvoicePage(invoice: invoice),
                              ),
                            ).then((shouldRefresh) {
                              if (shouldRefresh == true) {
                                ref
                                    .read(invoiceListProvider.notifier)
                                    .fetchInvoices();
                              }
                            });
                          },
                        ),

                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            final deleteInvoice = ref.read(
                              deleteInvoiceProvider,
                            );
                            await deleteInvoice(invoice.id);
                            await ref
                                .read(invoiceListProvider.notifier)
                                .fetchInvoices();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      ),
    );
  }
}
