// Purpose: Invoice data model with JSON support.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@freezed
class Invoice with _$Invoice {
  factory Invoice({
    required int id,
    required String customerName,
    required DateTime date,
    required double total,
    required bool isSynced,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}
