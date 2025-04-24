import 'package:dartz/dartz.dart';
import 'package:tradingapp_api_test/commons/failure/failure.dart';
import 'package:tradingapp_api_test/feature1/data/models/bot_model.dart';
import 'package:tradingapp_api_test/feature1/domin/entities/bot_entity.dart';
import 'package:tradingapp_api_test/feature1/domin/respositories/bot_repository.dart';

class GetAllBotsUseCase {
  final BotRepository repository;

  GetAllBotsUseCase({required this.repository});

  Future<Either<Failure, List<BotEntity>>> execute() {
    return repository.fetchAllBots();
  }
}
