import 'package:conerp/fv1/database/database.dart';
import 'package:conerp/fv1/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/invoice/presentation/pages/invoice_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   debugPrint('🕒 DEBUG: App started');

//   //await deleteDatabase();
//   final db = await getDatabasePath();
//   runApp(
//     const ProviderScope(child: MaterialApp(home: HomeScreen())),
//   ); // Removed db argument
// }

void main() {
  runApp(ProviderScope(child: MaterialApp(home: InvoicePage())));
}
