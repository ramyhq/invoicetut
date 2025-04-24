import 'package:dartz/dartz.dart';
import '../repositories/invoice_repository.dart';

class DeleteInvoice {
  final InvoiceRepository repository;

  DeleteInvoice(this.repository);

  Future<Either<String, void>> call(int id) {
    return repository.deleteInvoice(id);
  }
}
