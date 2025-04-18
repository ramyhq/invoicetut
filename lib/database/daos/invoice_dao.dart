//Purpose: Perform CRUD operations on the invoice table.

import 'package:conerp/database/database.dart';
import 'package:drift/drift.dart';

part 'invoice_dao.g.dart'; // ملف مولد تلقائيًا

@DriftAccessor(tables: [Invoices])
class InvoiceDao extends DatabaseAccessor<AppDatabase> with _$InvoiceDaoMixin {
  InvoiceDao(AppDatabase db) : super(db);

  Future<List<Invoice>> getAllInvoices() => select(invoices).get();
  Future<int> insertInvoice(Insertable<Invoice> invoice) =>
      into(invoices).insert(invoice);
}
