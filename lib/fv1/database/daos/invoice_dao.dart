//Purpose: Perform CRUD operations on the invoice table.

import 'dart:convert';

import 'package:conerp/fv1/database/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

part 'invoice_dao.g.dart';

@DriftAccessor(tables: [Invoices])
class InvoiceDao extends DatabaseAccessor<AppDatabase> with _$InvoiceDaoMixin {
  InvoiceDao(AppDatabase db) : super(db);

  // Get all invoices ordered by date
  Future<List<Invoice>> getAllInvoices() async {
    final wrongInvoices = await (select(invoices)).get();
    debugPrint('🕒 DEBUG: getAllInvoices1: ${wrongInvoices[1].date}');
    // debugPrint('🕒 DEBUG: getAllInvoices: ${await (select(invoices)..orderBy([(t) => OrderingTerm.desc(t.date)])).get()}');

    return (select(invoices)
      ..orderBy([(t) => OrderingTerm.desc(t.date)])).get();
  }

  // Get a single invoice by id
  Future<Invoice?> getInvoiceById(int id) =>
      (select(invoices)..where((t) => t.id.equals(id))).getSingleOrNull();

  // Insert a new invoice
  Future<int> insertInvoice(Insertable<Invoice> invoice) =>
      into(invoices).insert(invoice);

  // Update an existing invoice
  Future<bool> updateInvoice(Invoice invoice) =>
      update(invoices).replace(invoice);

  // Delete an invoice
  Future<int> deleteInvoice(int id) =>
      (delete(invoices)..where((t) => t.id.equals(id))).go();

  // Stream of all invoices for real-time updates
  Stream<List<Invoice>> watchAllInvoices() =>
      (select(invoices)..orderBy([(t) => OrderingTerm.desc(t.date)])).watch();
}
