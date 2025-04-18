import 'package:conerp/database/database.dart';
import 'package:conerp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // Removed async as db initialization is handled by provider
  WidgetsFlutterBinding.ensureInitialized();
  // Removed: final db = AppDatabase(); - Database is now provided via Riverpod
  runApp(
    const ProviderScope(child: MaterialApp(home: HomeScreen())),
  ); // Removed db argument
}
