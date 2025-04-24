// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _isSyncedMeta =
      const VerificationMeta('isSynced');
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
      'is_synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, customerName, date, total, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(Insertable<Invoice> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(_isSyncedMeta,
          isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total'])!,
      isSynced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_synced'])!,
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final int id;
  final String customerName;
  final DateTime date;
  final double total;
  final bool isSynced;
  const Invoice(
      {required this.id,
      required this.customerName,
      required this.date,
      required this.total,
      required this.isSynced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['customer_name'] = Variable<String>(customerName);
    map['date'] = Variable<DateTime>(date);
    map['total'] = Variable<double>(total);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      customerName: Value(customerName),
      date: Value(date),
      total: Value(total),
      isSynced: Value(isSynced),
    );
  }

  factory Invoice.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<int>(json['id']),
      customerName: serializer.fromJson<String>(json['customerName']),
      date: serializer.fromJson<DateTime>(json['date']),
      total: serializer.fromJson<double>(json['total']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customerName': serializer.toJson<String>(customerName),
      'date': serializer.toJson<DateTime>(date),
      'total': serializer.toJson<double>(total),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Invoice copyWith(
          {int? id,
          String? customerName,
          DateTime? date,
          double? total,
          bool? isSynced}) =>
      Invoice(
        id: id ?? this.id,
        customerName: customerName ?? this.customerName,
        date: date ?? this.date,
        total: total ?? this.total,
        isSynced: isSynced ?? this.isSynced,
      );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      date: data.date.present ? data.date.value : this.date,
      total: data.total.present ? data.total.value : this.total,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('date: $date, ')
          ..write('total: $total, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, customerName, date, total, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.customerName == this.customerName &&
          other.date == this.date &&
          other.total == this.total &&
          other.isSynced == this.isSynced);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<int> id;
  final Value<String> customerName;
  final Value<DateTime> date;
  final Value<double> total;
  final Value<bool> isSynced;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.customerName = const Value.absent(),
    this.date = const Value.absent(),
    this.total = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.id = const Value.absent(),
    required String customerName,
    this.date = const Value.absent(),
    required double total,
    this.isSynced = const Value.absent(),
  })  : customerName = Value(customerName),
        total = Value(total);
  static Insertable<Invoice> custom({
    Expression<int>? id,
    Expression<String>? customerName,
    Expression<DateTime>? date,
    Expression<double>? total,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerName != null) 'customer_name': customerName,
      if (date != null) 'date': date,
      if (total != null) 'total': total,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  InvoicesCompanion copyWith(
      {Value<int>? id,
      Value<String>? customerName,
      Value<DateTime>? date,
      Value<double>? total,
      Value<bool>? isSynced}) {
    return InvoicesCompanion(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      date: date ?? this.date,
      total: total ?? this.total,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('date: $date, ')
          ..write('total: $total, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final InvoiceDao invoiceDao = InvoiceDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [invoices];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$InvoicesTableCreateCompanionBuilder = InvoicesCompanion Function({
  Value<int> id,
  required String customerName,
  Value<DateTime> date,
  required double total,
  Value<bool> isSynced,
});
typedef $$InvoicesTableUpdateCompanionBuilder = InvoicesCompanion Function({
  Value<int> id,
  Value<String> customerName,
  Value<DateTime> date,
  Value<double> total,
  Value<bool> isSynced,
});

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnFilters(column));
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSynced => $composableBuilder(
      column: $table.isSynced, builder: (column) => ColumnOrderings(column));
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$InvoicesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InvoicesTable,
    Invoice,
    $$InvoicesTableFilterComposer,
    $$InvoicesTableOrderingComposer,
    $$InvoicesTableAnnotationComposer,
    $$InvoicesTableCreateCompanionBuilder,
    $$InvoicesTableUpdateCompanionBuilder,
    (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
    Invoice,
    PrefetchHooks Function()> {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> customerName = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> total = const Value.absent(),
            Value<bool> isSynced = const Value.absent(),
          }) =>
              InvoicesCompanion(
            id: id,
            customerName: customerName,
            date: date,
            total: total,
            isSynced: isSynced,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String customerName,
            Value<DateTime> date = const Value.absent(),
            required double total,
            Value<bool> isSynced = const Value.absent(),
          }) =>
              InvoicesCompanion.insert(
            id: id,
            customerName: customerName,
            date: date,
            total: total,
            isSynced: isSynced,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InvoicesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InvoicesTable,
    Invoice,
    $$InvoicesTableFilterComposer,
    $$InvoicesTableOrderingComposer,
    $$InvoicesTableAnnotationComposer,
    $$InvoicesTableCreateCompanionBuilder,
    $$InvoicesTableUpdateCompanionBuilder,
    (Invoice, BaseReferences<_$AppDatabase, $InvoicesTable, Invoice>),
    Invoice,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
}
