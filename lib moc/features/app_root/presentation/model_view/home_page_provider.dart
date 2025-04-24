import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/usecases/get_all_characters.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/entities/character.dart';
import 'package:flutter_clean_architecture_provider_character_app_new2024/features/app_root/domain/usecases/get_all_characters.dart';
import 'package:flutter/foundation.dart';


// result.fold(
// // The first function is executed in case of failure (Left side)
// (e) {
// _error = "fail";
// _isLoading = false;
// },
// // The second function is executed in case of success (Right side)
// (list) {
// _charactersList = list;
// _isLoading = false;
// }
// );

class HomePageProvider with ChangeNotifier {
  final GetAllCharacters _getAllCharacters;

  HomePageProvider({@required GetAllCharacters getAllCharacters})
      : _getAllCharacters = getAllCharacters;

  bool _isLoading = false;
  List<Character> _charactersList;
  String _error;

  bool get isLoading => _isLoading;
  List<Character> get charactersList => _charactersList;
  String get error => _error;

  Future<void> loadAllCharacters() async {
    _isLoading = true;
    notifyListeners();

    final result = await _getAllCharacters.getAllCharacters();

    result.fold((e) {
      _error = "fail";
      _isLoading = false;
    }, (list) {
      _charactersList = list;
      _isLoading = false;
    });

    notifyListeners();
  }
}
