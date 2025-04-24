import 'package:flutter/material.dart';
import '../../main.dart';

///
/// This file include Exceptions types
///
class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this .message);
}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'NoInternetException Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
    }
    this._message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
