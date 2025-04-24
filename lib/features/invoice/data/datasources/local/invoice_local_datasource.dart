import 'package:drift/drift.dart';

import '/core/database/app_database.dart';
import '../../models/invoice_model.dart';

/// Abstract interface for local data source
abstract class InvoiceLocalDataSource {
  Future<List<InvoiceModel>> getAllInvoices();
  Future<void> addInvoice(InvoiceModel invoice);
  Future<void> updateInvoice(InvoiceModel invoice);
  Future<void> deleteInvoice(int id);
}

/// Concrete implementation using Drift
class InvoiceLocalDataSourceImpl implements InvoiceLocalDataSource {
  final AppDatabase db;

  InvoiceLocalDataSourceImpl({required this.db});

  @override
  Future<List<InvoiceModel>> getAllInvoices() async {
    final result = await db.select(db.invoices).get();
    return result.map((e) => InvoiceModel.fromDrift(e)).toList();
  }

  @override
  Future<void> addInvoice(InvoiceModel invoice) async {
    final companion = InvoicesCompanion.insert(
      title: invoice.title,
      amount: invoice.amount,
    );
    await db.into(db.invoices).insert(companion);
  }

  @override
  Future<void> updateInvoice(InvoiceModel invoice) async {
    final updatedRow = InvoicesCompanion(
      id: Value(invoice.id),
      title: Value(invoice.title),
      amount: Value(invoice.amount),
    );

    await db.update(db.invoices).replace(updatedRow);
  }

  @override
  Future<void> deleteInvoice(int id) async {
    final query = db.delete(db.invoices)..where((tbl) => tbl.id.equals(id));
    await query.go();
  }
}
