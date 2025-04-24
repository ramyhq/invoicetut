// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:conerp/features/invoice/presentation/pages/invoice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Added for ProviderScope
import 'package:conerp/fv1/screens/home_screen.dart'; // Added for HomeScreen
// Removed: import 'package:conerp/main.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: InvoicePage())),
    );
  });
}
