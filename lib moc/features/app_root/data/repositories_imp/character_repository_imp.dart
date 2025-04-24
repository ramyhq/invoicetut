import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/caching/in_memory_cache.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/error/failure.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/failures/failure.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/network/NetworkInfo.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/data/datasource/local/character_local_datasource.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/data/datasource/remote/character_network_datasource.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/entities/character.dart';


class CharacterRepositoryImpl extends CharacterRepository {
  final NetworkInfo networkInfo;
  final CharacterLocalDatasource localDatasource;
  final CharacterNetworkDatasource networkDatasource;
  final InMemoryCache inMemoryCache;

  CharacterRepositoryImpl({
    this.networkInfo,
    this.localDatasource,
    this.networkDatasource,
    this.inMemoryCache,
  });

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() async {
    if (inMemoryCache.isNotEmpty && inMemoryCache.hasNotExpired) {
      return Right(inMemoryCache.getCachedValue());
    }

    return await networkInfo.isConnected
        ? _getAllChatactersFromNetwork()
        : _getAllCharactersFromLocalCache();
  }

  Future<Either<Failure, List<Character>>>
      _getAllChatactersFromNetwork() async {
    try {
      final allCharactersList = await networkDatasource.getAllCharacters();
      await localDatasource.cacheCharacterList(allCharactersList);
      inMemoryCache.save(allCharactersList);
      return Right(allCharactersList);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Failure, List<Character>>>
      _getAllCharactersFromLocalCache() async {
    try {
      final allCharactersList = await localDatasource.getAllCharacters();
      inMemoryCache.save(allCharactersList);
      return Right(allCharactersList);
    } catch (e) {
      return Left(ServerFailure(
          message:
          'Failure in BotRepositoryImpl >> getAllBots() and MESSAGE IS:${e.toString()}'));
    }
  }
}
