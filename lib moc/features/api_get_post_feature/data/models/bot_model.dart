
import '../../domin/entities/bot_entity.dart';

class BotModel extends BotEntity {
  const BotModel({
    final int? id,
    final String? nameChannel,
    final String? name,
    final int? discount,
    final int? price,
    final String? percentage1,
    final String? percentage2,
    final String? percentage3,
    final int? numberBot,
    final List<dynamic>? planDesc,
    final List<dynamic>? telegramGroups,
  }) : super(
          id: id,
          nameChannel: nameChannel,
          name: name,
          discount: discount,
          price: price,
          percentage1: percentage1,
          percentage2: percentage2,
          percentage3: percentage3,
          numberBot: numberBot,
          planDesc: planDesc,
          telegramGroups: telegramGroups,
        );

  factory BotModel.fromJson(Map<String, dynamic> json) {
    try {
      return BotModel(
        id: json['id'],
        nameChannel: json['nameChannel'],
        name: json['name'],
        discount: json['discount'],
        price: json['price'],
        percentage1: json['percentage1'],
        percentage2: json['percentage2'],
        percentage3: json['percentage3'],
        numberBot: json['number_bot'],
        planDesc: json['plan_desc'],
        telegramGroups: json['telegram_groups'],
      );
    } catch (e) {
      print('BotModel.fromJson ERROR : ${e.toString()}');
      return BotModel();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameChannel': nameChannel,
      'name': name,
      'discount': discount,
      'price': price,
      'percentage1': percentage1,
      'percentage2': percentage2,
      'percentage3': percentage3,
      'number_bot': numberBot,
      'plan_desc': planDesc,
      'telegram_groups': telegramGroups,
    };
  }
}

