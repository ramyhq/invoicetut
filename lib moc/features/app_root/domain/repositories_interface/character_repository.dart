
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/commons/failures/failure.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getAllCharacters();
}

