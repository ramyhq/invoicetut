import 'package:flutter/material.dart';
import 'package:tradingapp_api_test/feature1/domin/entities/bot_entity.dart';

class BotListTile extends StatelessWidget {
  final BotEntity botModel;

  const BotListTile({
    super.key,
    required this.botModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(width: 20),
            Container(
                width: 50,
                height: 50,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/badge_crown.png'),
                )),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: ${botModel.name ?? '-'} || id: ${botModel.id ?? '-'} ',
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Channel Name: ${botModel.nameChannel ?? '-'} || discount: ${botModel.discount ?? '-'} ',
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Price: ${botModel.price ?? '-'} || percentage1: ${botModel.percentage1 ?? '-'} ',
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 5),

                  Text(
                    'Bot Number: ${botModel.numberBot ?? '-'}',
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 15),
                  Divider(color: Colors.grey[300], height: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
