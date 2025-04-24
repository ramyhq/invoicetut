import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/invoice_entity.dart';
import '../providers/invoice_provider.dart';

class AddInvoicePage extends ConsumerStatefulWidget {
  const AddInvoicePage({super.key});

  @override
  ConsumerState<AddInvoicePage> createState() => _AddInvoicePageState();
}

class _AddInvoicePageState extends ConsumerState<AddInvoicePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _addInvoice() async {
    final invoice = InvoiceEntity(
      id: 0, // ID بيتم توليده في SQLite تلقائيًا
      title: titleController.text.trim(),
      amount: double.tryParse(amountController.text.trim()) ?? 0.0,
    );

    final result = await ref.read(addInvoiceProvider).call(invoice);

    result.fold(
      (error) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('خطأ: $error'))),
      (_) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('تمت الإضافة')));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة فاتورة")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "العنوان"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "المبلغ"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _addInvoice, child: const Text("إضافة")),
          ],
        ),
      ),
    );
  }
}
