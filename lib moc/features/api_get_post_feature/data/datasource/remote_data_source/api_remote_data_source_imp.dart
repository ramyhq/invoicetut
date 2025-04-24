import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:tradingapp_api_test/commons/exceptions/exception.dart';
import 'package:tradingapp_api_test/feature1/data/datasource/remote_data_source/api_remote_data_source.dart';
import 'package:tradingapp_api_test/feature1/data/models/bot_model.dart';

class BotModelRemoteDatasourceImpl extends BotModelRemoteDatasource {
  late http.Client client;

  BotModelRemoteDatasourceImpl(){
    client = http.Client();
  }

  @override
  Future<List<BotModel>> fetchAllBots() async {
    final response = await client.get(
        Uri.parse('https://gfoura.smartidea.tech/api/plan2/'),
        headers: {'Content-type': 'application/json'});

    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      Map<String, dynamic> infoAndResult = json.decode(response.body);
      List<dynamic> result = infoAndResult['data'];

      List<BotModel> botsList = [];
      for (Map<String, dynamic> item in result) {
         botsList.add(BotModel.fromJson(item));
       }
      return botsList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ServerException();
    }
  }

  @override
  Future<Map<String,dynamic>> addBot(Map<String, dynamic> data) async {
    print('⚠️ Post this data: $data');

    final response = await client.post(
        Uri.parse('https://gfoura.smartidea.tech/api/plan2'),
        body: jsonEncode(data),
        headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode == 201) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      Map<String, dynamic> infoAndResult = json.decode(response.body);

      return infoAndResult;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw ServerException();
    }
  }

}
