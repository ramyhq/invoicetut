// Purpose: Invoice data model with JSON support.
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

void _logToFile(String message) {
  try {
    final file = File('debug_log.txt');
    final path = file.absolute.path; // احصل على المسار الكامل
    debugPrint('🔄 Log file path: $path'); // اطبع المسار في الكونسول
    file.writeAsStringSync('$message\n', mode: FileMode.append);
  } catch (e) {
    debugPrint('❌ Error writing to log: $e');
  }
}

DateTime _dateFromJson(dynamic json) {
  try {
    _logToFile('Parsing date value: $json (type: ${json.runtimeType})');

    if (json is String) {
      // Remove Z suffix if present
      final cleanJson =
          json.endsWith('Z') ? json.substring(0, json.length - 1) : json;
      _logToFile('Cleaned date string: $cleanJson');

      // Try parsing as timestamp
      final timestamp = int.tryParse(cleanJson);
      if (timestamp != null) {
        final result = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
        _logToFile('Parsed as timestamp: $result');
        return result;
      }

      // Try parsing as ISO date
      try {
        final result = DateTime.parse(cleanJson);
        _logToFile('Parsed as ISO date: $result');
        return result;
      } catch (e) {
        _logToFile('Failed to parse as ISO date: $e');
      }
    }

    // If it's a number, treat as timestamp
    if (json is num) {
      final result = DateTime.fromMillisecondsSinceEpoch(json.toInt() * 1000);
      _logToFile('Parsed numeric timestamp: $result');
      return result;
    }

    throw FormatException('Invalid date format: $json');
  } catch (e) {
    _logToFile('ERROR: Date parsing failed: $e');
    // Return a default date instead of crashing
    return DateTime.now();
  }
}

@freezed
class Invoice with _$Invoice {
  factory Invoice({
    required int id,
    required String customerName,
    // @JsonKey(fromJson: _dateFromJson) required DateTime date,
    required DateTime date,
    required double total,
    @Default(false) bool isSynced,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}
