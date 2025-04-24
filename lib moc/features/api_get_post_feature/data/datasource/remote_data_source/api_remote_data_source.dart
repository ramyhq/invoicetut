import 'package:flutter/foundation.dart';
import 'package:tradingapp_api_test/feature1/data/models/bot_model.dart';


abstract class BotModelRemoteDatasource {
  Future<List<BotModel>> fetchAllBots();
  Future<Map<String,dynamic>> addBot(Map<String, dynamic> data);
}