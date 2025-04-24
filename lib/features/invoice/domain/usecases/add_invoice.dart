import 'package:dartz/dartz.dart';
import '../entities/invoice_entity.dart';
import '../repositories/invoice_repository.dart';

class AddInvoice {
  final InvoiceRepository repository;

  AddInvoice(this.repository);

  Future<Either<String, void>> call(InvoiceEntity invoice) {
    return repository.addInvoice(invoice);
  }
}
