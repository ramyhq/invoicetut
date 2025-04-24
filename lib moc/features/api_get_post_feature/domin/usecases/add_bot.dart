import 'package:dartz/dartz.dart';
import 'package:tradingapp_api_test/commons/failure/failure.dart';
import 'package:tradingapp_api_test/feature1/data/models/bot_model.dart';
import 'package:tradingapp_api_test/feature1/domin/entities/bot_entity.dart';
import 'package:tradingapp_api_test/feature1/domin/respositories/bot_repository.dart';


class AddBotUseCase {
  final BotRepository repository;

  AddBotUseCase({required this.repository,});

  Future<Either<Failure, Map<String,dynamic>>> execute(Map<String, dynamic> data) {
    return repository.addBot(data);
  }
}
