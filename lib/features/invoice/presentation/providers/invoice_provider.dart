import 'package:conerp/core/database/database_provider.dart';
import 'package:conerp/core/network/dio_provider.dart';
import 'package:conerp/features/invoice/data/datasources/remote/invoice_remote_datasource.dart';
import 'package:conerp/features/invoice/data/datasources/remote/invoice_remote_datasource_provider.dart';
import 'package:conerp/features/invoice/domain/repositories/invoice_repository.dart';
import 'package:conerp/features/invoice/domain/usecases/delete_invoice.dart';
import 'package:conerp/features/invoice/domain/usecases/update_invoice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/local/invoice_local_datasource.dart';
import '../.././data/repositories/invoice_repository_impl.dart';
import '../.././domain/entities/invoice_entity.dart';
import '../.././domain/usecases/get_all_invoices.dart';
import '../.././domain/usecases/add_invoice.dart';
import '../../../../core/database/app_database.dart';

// Local DataSource Provider
final invoiceLocalDataSourceProvider = Provider<InvoiceLocalDataSource>((ref) {
  final db = ref.read(dbProvider);
  return InvoiceLocalDataSourceImpl(db: db);
});

// Remote DataSource Provider
final invoiceRemoteDataSourceProvider = Provider<InvoiceRemoteDataSource>((
  ref,
) {
  final dio = ref.read(dioProvider);
  return InvoiceRemoteDataSourceImpl(dio: dio);
});

// Repository Provider
final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  final local = ref.read(invoiceLocalDataSourceProvider);
  final remote = ref.read(invoiceRemoteDataSourceProvider);
  return InvoiceRepositoryImpl(
    localDataSource: local,
    remoteDataSource: remote,
  );
});

// UseCases
final getAllInvoicesProvider = Provider<GetAllInvoices>((ref) {
  return GetAllInvoices(ref.read(invoiceRepositoryProvider));
});

final addInvoiceProvider = Provider<AddInvoice>((ref) {
  return AddInvoice(ref.read(invoiceRepositoryProvider));
});

final updateInvoiceProvider = Provider<UpdateInvoice>((ref) {
  return UpdateInvoice(ref.read(invoiceRepositoryProvider));
});

final deleteInvoiceProvider = Provider<DeleteInvoice>((ref) {
  return DeleteInvoice(ref.read(invoiceRepositoryProvider));
});

// State Provider
final invoiceListProvider =
    StateNotifierProvider<InvoiceNotifier, AsyncValue<List<InvoiceEntity>>>((
      ref,
    ) {
      final getAll = ref.read(getAllInvoicesProvider);
      return InvoiceNotifier(getAll);
    });

class InvoiceNotifier extends StateNotifier<AsyncValue<List<InvoiceEntity>>> {
  final GetAllInvoices getAllInvoices;

  InvoiceNotifier(this.getAllInvoices) : super(const AsyncLoading()) {
    fetchInvoices();
  }

  Future<void> fetchInvoices() async {
    final result = await getAllInvoices();
    result.fold(
      (error) => state = AsyncError(error, StackTrace.current),
      (invoices) => state = AsyncData(invoices),
    );
  }
}
