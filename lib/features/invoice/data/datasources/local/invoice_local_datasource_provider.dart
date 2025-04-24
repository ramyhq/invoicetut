import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:conerp/core/database/database_provider.dart';
import 'package:conerp/features/invoice/data/datasources/local/invoice_local_datasource.dart';

/// Provider for InvoiceLocalDataSource using the shared AppDatabase instance
final invoiceLocalDataSourceProvider = Provider<InvoiceLocalDataSource>((ref) {
  final db = ref.watch(dbProvider);
  return InvoiceLocalDataSourceImpl(db: db);
});
