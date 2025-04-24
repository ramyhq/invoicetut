import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:conerp/core/network/dio_provider.dart';
import 'package:conerp/features/invoice/data/datasources/remote/invoice_remote_datasource.dart';

final invoiceRemoteDataSourceProvider = Provider<InvoiceRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return InvoiceRemoteDataSourceImpl(dio: dio);
});
