import 'package:dio/dio.dart';
import 'package:conerp/features/invoice/data/models/invoice_model.dart';

abstract class InvoiceRemoteDataSource {
  Future<List<InvoiceModel>> fetchInvoices();
  Future<void> addInvoice(InvoiceModel invoice);
  Future<void> updateInvoice(InvoiceModel invoice);
  Future<void> deleteInvoice(int id);
}

class InvoiceRemoteDataSourceImpl implements InvoiceRemoteDataSource {
  final Dio dio;

  InvoiceRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<InvoiceModel>> fetchInvoices() async {
    final response = await dio.get('/invoices');
    final data = response.data as List;
    return data.map((json) => InvoiceModel.fromJson(json)).toList();
  }

  @override
  Future<void> addInvoice(InvoiceModel invoice) async {
    await dio.post('/invoices', data: invoice.toJson());
  }

  @override
  Future<void> updateInvoice(InvoiceModel invoice) async {
    await dio.put('/invoices/${invoice.id}', data: invoice.toJson());
  }

  @override
  Future<void> deleteInvoice(int id) async {
    await dio.delete('/invoices/$id');
  }
}
