import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/caching/in_memory_cache.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/network/NetworkInfo.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/data/datasource/local/character_local_datasource.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/data/datasource/remote/character_network_datasource.dart';

import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/data/repositories/character_repository.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/usecases/get_all_characters.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/presentation/model_view/home_page_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  sl.registerFactory(() => HomePageProvider(
        getAllCharacters: sl(),
      ));

  sl.registerFactory<GetAllCharacters>(() => GetAllCharactersImpl(
        charactersRepository: sl(),
      ));

  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(
        inMemoryCache: sl(),
        localDatasource: sl(),
        networkDatasource: sl(),
        networkInfo: sl(),
      ));

  sl.registerFactory(() => InMemoryCache());

  sl.registerFactory<CharacterLocalDatasource>(
      () => CharacterLocalDatasourceImpl(sharedPreferences: sl()));

  sl.registerFactory<CharacterNetworkDatasource>(
      () => CharacterNetworkDatasourceImpl(client: sl()));

  sl.registerFactory<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  final sharedPref = await SharedPreferences.getInstance();

  sl.registerFactory(() => sharedPref);

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => DataConnectionChecker());
}
