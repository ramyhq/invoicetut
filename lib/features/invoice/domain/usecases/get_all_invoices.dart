import 'package:dartz/dartz.dart';
import '../entities/invoice_entity.dart';
import '../repositories/invoice_repository.dart';

/// Use case to get all invoices
class GetAllInvoices {
  final InvoiceRepository repository;

  GetAllInvoices(this.repository);

  Future<Either<String, List<InvoiceEntity>>> call() {
    return repository.getAllInvoices();
  }
}
