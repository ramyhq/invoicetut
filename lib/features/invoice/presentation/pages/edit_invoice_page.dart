import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/invoice_entity.dart';
import '../providers/invoice_provider.dart';

class EditInvoicePage extends ConsumerStatefulWidget {
  final InvoiceEntity invoice;

  const EditInvoicePage({Key? key, required this.invoice}) : super(key: key);

  @override
  ConsumerState<EditInvoicePage> createState() => _EditInvoicePageState();
}

class _EditInvoicePageState extends ConsumerState<EditInvoicePage> {
  late TextEditingController titleController;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.invoice.title);
    amountController = TextEditingController(
      text: widget.invoice.amount.toString(),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _updateInvoice() async {
    final updatedInvoice = InvoiceEntity(
      id: widget.invoice.id,
      title: titleController.text.trim(),
      amount: double.tryParse(amountController.text) ?? 0.0,
    );

    final result = await ref.read(updateInvoiceProvider).call(updatedInvoice);

    result.fold(
      (error) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('خطأ: $error'))),
      (_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('تم تعديل الفاتورة')));
        Navigator.pop(context, true); // هنرجع true علشان نعمل refresh للبيانات
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تعديل فاتورة")),
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
            ElevatedButton(
              onPressed: _updateInvoice,
              child: const Text("تعديل"),
            ),
          ],
        ),
      ),
    );
  }
}
