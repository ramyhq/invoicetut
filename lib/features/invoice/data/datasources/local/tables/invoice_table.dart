import 'package:drift/drift.dart';

class Invoices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  RealColumn get amount => real()();
}
