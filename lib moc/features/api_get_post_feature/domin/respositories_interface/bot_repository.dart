import 'package:dartz/dartz.dart';
import 'package:tradingapp_api_test/commons/failure/failure.dart';
import 'package:tradingapp_api_test/feature1/data/models/bot_model.dart';

abstract class BotRepository {
  Future<Either<Failure, List<BotModel>>> fetchAllBots();
  Future<Either<Failure, Map<String,dynamic>>> addBot(Map<String, dynamic> data);
}
