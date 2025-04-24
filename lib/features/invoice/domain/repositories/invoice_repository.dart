import 'package:conerp/features/invoice/domain/entities/invoice_entity.dart';
import 'package:dartz/dartz.dart';

abstract class InvoiceRepository {
  Future<Either<String, List<InvoiceEntity>>> getAllInvoices();
  Future<Either<String, void>> addInvoice(InvoiceEntity invoice);
  Future<Either<String, void>> updateInvoice(InvoiceEntity invoice);
  Future<Either<String, void>> deleteInvoice(int id);
}
