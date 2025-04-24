import 'dart:io';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:tradingapp_api_test/feature1/data/datasource/remote_data_source/api_remote_data_source_imp.dart';
import 'package:tradingapp_api_test/feature1/data/repositories/bot_repository_impl.dart';
import 'package:tradingapp_api_test/feature1/domin/entities/bot_entity.dart';
import 'package:tradingapp_api_test/feature1/domin/usecases/add_bot.dart';
import 'package:tradingapp_api_test/feature1/domin/usecases/get_all_bots.dart';
part 'bot_state.dart';

class BotCubit extends Cubit<BotState> {
  late GetAllBotsUseCase _getAllBotsUseCase;
  late AddBotUseCase _addBotUseCase;
  BotCubit() : super(BotsInitial()) {
    _getAllBotsUseCase = GetAllBotsUseCase(
        repository: BotRepositoryImpl(
            remoteDataSource: BotModelRemoteDatasourceImpl()));

    _addBotUseCase = AddBotUseCase(
        repository: BotRepositoryImpl(
            remoteDataSource: BotModelRemoteDatasourceImpl()));
  }

  Future<void> getBots() async {
    try {
      emit(BotsLoading());
      final result = await _getAllBotsUseCase.execute();

      result.fold((failure) {
        emit(BotsFailure());
      }, (list) {
        emit(BotsLoaded(bots: list));
      });
    } on SocketException catch (_) {
      emit(BotsFailure());
    } catch (_) {
      emit(BotsFailure());
    }
  }

  Future<void> addBot({required Map<String, dynamic> data}) async {
    try {
      emit(BotsLoading());
      //final result = await _addBotUseCase.execute(data);
      final result = await _addBotUseCase.execute(data);

      result.fold((e) {
        emit(BotsFailure());
      }, (respond) {
        emit(BotsSuccess(msg: respond['message']));
        getBots();
      });
    } on SocketException catch (_) {
      emit(BotsFailure());
    } catch (_) {
      emit(BotsFailure());
    }
  }
}
