import 'package:equatable/equatable.dart';

class BotEntity extends Equatable {
  final int? id;
  final String? nameChannel;
  final String? name;
  final int? discount;
  final int? price;
  final String? percentage1;
  final String? percentage2;
  final String? percentage3;
  final int? numberBot;
  final List<dynamic>? planDesc;
  final List<dynamic>? telegramGroups;

  const BotEntity({
    this.id,
    this.nameChannel,
    this.name,
    this.discount,
    this.price,
    this.percentage1,
    this.percentage2,
    this.percentage3,
    this.numberBot,
    this.planDesc,
    this.telegramGroups,
  });

  @override
  List<Object?> get props => [
    id,
    nameChannel,
    name,
    discount,
    price,
    percentage1,
    percentage2,
    percentage3,
    numberBot,
    planDesc,
    telegramGroups,
      ];
}
