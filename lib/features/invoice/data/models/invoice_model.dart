import '../../domain/entities/invoice_entity.dart';
import '/core/database/app_database.dart';

class InvoiceModel extends InvoiceEntity {
  InvoiceModel({required int id, required String title, required double amount})
    : super(id: id, title: title, amount: amount);

  factory InvoiceModel.fromDrift(Invoice invoice) {
    return InvoiceModel(
      id: invoice.id,
      title: invoice.title,
      amount: invoice.amount,
    );
  }

  Invoice toDrift() {
    return Invoice(
      id: id,
      title: title,
      amount: amount,
    );
  }
}
