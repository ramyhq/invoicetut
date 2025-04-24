import 'package:dartz/dartz.dart';
import '../entities/invoice_entity.dart';
import '../repositories/invoice_repository.dart';

class UpdateInvoice {
  final InvoiceRepository repository;

  UpdateInvoice(this.repository);

  Future<Either<String, void>> call(InvoiceEntity invoice) {
    return repository.updateInvoice(invoice);
  }
}
