import 'package:dartz/dartz.dart';

class BotRepositoryImpl implements BotRepository {
  final BotModelRemoteDatasource remoteDataSource;

  BotRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BotModel>>> fetchAllBots() async {

    try {
      final allBotsList = await remoteDataSource.fetchAllBots();
      return Right(allBotsList);
    } catch (e) {
      return Left(ServerFailure(
          message:
              'Failure in BotRepositoryImpl >> getAllBots() and MESSAGE IS:${e.toString()}'));
    }


  }

  @override
  Future<Either<Failure, Map<String,dynamic>>> addBot(Map<String, dynamic> data) async {
    try {

      final allBotsList = await remoteDataSource.addBot( data);
      return Right(allBotsList);
    } catch (e) {
      return Left(ServerFailure(
          message:
          'Failure in BotRepositoryImpl >> getAllBots() and MESSAGE IS:${e.toString()}'));
    }


  }


}
