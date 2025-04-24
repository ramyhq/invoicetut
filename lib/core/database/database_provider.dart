import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:conerp/core/database/app_database.dart';

/// Provides the instance of AppDatabase (Drift DB)
final dbProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
