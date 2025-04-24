import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/data/repositories/character_repository.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/entities/character.dart';

abstract class GetAllCharacters {
  Future<Either<Failure, List<Character>>> getAllCharacters();
}

class GetAllCharactersImpl extends GetAllCharacters {
  final CharacterRepository charactersRepository;

  GetAllCharactersImpl({required this.charactersRepository});

  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() {
    return charactersRepository.getAllCharacters();
  }
}



