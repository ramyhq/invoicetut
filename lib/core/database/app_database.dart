import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:conerp/features/invoice/data/datasources/local/tables/invoice_table.dart';
part 'app_database.g.dart'; // Drift will generate this

@DriftDatabase(tables: [Invoices])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, 'app.sqlite');
    return NativeDatabase(File(dbPath));
  });
}
