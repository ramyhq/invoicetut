import 'package:conerp/features/invoice/data/datasources/remote/invoice_remote_datasource.dart';

import '../../domain/entities/invoice_entity.dart';
import '../../domain/repositories/invoice_repository.dart';
import '../datasources/local/invoice_local_datasource.dart';
import '../models/invoice_model.dart';
import 'package:dartz/dartz.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceLocalDataSource localDataSource;
  final InvoiceRemoteDataSource remoteDataSource;

  InvoiceRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<String, List<InvoiceEntity>>> getAllInvoices() async {
    try {
      final result = await localDataSource.getAllInvoices();
      // You can enhance logic here (like fetching remote if local empty)
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> addInvoice(InvoiceEntity invoice) async {
    try {
      final model = InvoiceModel(
        id: invoice.id,
        title: invoice.title,
        amount: invoice.amount,
      );

      await localDataSource.addInvoice(model);
      //await remoteDataSource.sendInvoiceToServer(model);

      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateInvoice(InvoiceEntity invoice) async {
    try {
      final model = InvoiceModel(
        id: invoice.id,
        title: invoice.title,
        amount: invoice.amount,
      );
      await localDataSource.updateInvoice(model);
      // await remoteDataSource.updateInvoiceRemotely(model);

      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteInvoice(int id) async {
    try {
      await localDataSource.deleteInvoice(id);
      // await remoteDataSource.deleteInvoiceRemotely(id);

      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
