import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradingapp_api_test/feature1/domin/entities/bot_entity.dart';
import 'package:tradingapp_api_test/feature1/presentation/cubit/bot/bot_cubit.dart';
import 'package:tradingapp_api_test/feature1/presentation/widgets/textfield_container_widget.dart';

class AddBotsPage extends StatefulWidget {
  const AddBotsPage({super.key});

  @override
  State<AddBotsPage> createState() => _AddBotsPageState();
}

class _AddBotsPageState extends State<AddBotsPage> {
  Map<String, dynamic> data = {
    "plan_desc": [],
    "telegram_groups": []
  };

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameChannelController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _percentage1Controller = TextEditingController();
  final TextEditingController _percentage2Controller = TextEditingController();
  final TextEditingController _percentage3Controller = TextEditingController();
  final TextEditingController _numberBotController = TextEditingController();
  final TextEditingController _planDescController = TextEditingController();
  final TextEditingController _telegramGroupsController =
      TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nameChannelController.dispose();
    _nameController.dispose();
    _discountController.dispose();
    _priceController.dispose();
    _percentage1Controller.dispose();
    _percentage2Controller.dispose();
    _percentage3Controller.dispose();
    _numberBotController.dispose();
    _planDescController.dispose();
    _telegramGroupsController.dispose();

    super.dispose();
  }

  Widget _buildInputWidget({
    required String label,
    required TextEditingController tc,
    void Function(String value)? onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: const Offset(0, 0.50),
          ),
        ],
      ),
      child: TextFieldContainerWidget(
        controller: tc,
        prefixIcon: Icons.drive_file_rename_outline,
        hintText: label,
        keyboardType: TextInputType.text,
        borderRadius: 0,
        color: Colors.white,
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adding Bots"),
        actions: [
          InkWell(
            onTap: () {
              BlocProvider.of<BotCubit>(context).addBot(data: data);
            },
            child: Row(
              children: const [
                Icon(Icons.save),
                Text('  Add Bot  '),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildInputWidget(
                label: 'id',
                tc: _idController,
                onChanged: (input) => data['id'] = input),
            _buildInputWidget(
                label: 'nameChannel',
                tc: _nameChannelController,
                onChanged: (input) => data['nameChannel'] = input),
            _buildInputWidget(
                label: 'name',
                tc: _nameController,
                onChanged: (input) => data['name'] = input),
            _buildInputWidget(
                label: 'discount',
                tc: _discountController,
                onChanged: (input) => data['discount'] = input),
            _buildInputWidget(
                label: 'price',
                tc: _priceController,
                onChanged: (input) => data['price'] = input),
            _buildInputWidget(
                label: 'percentage1',
                tc: _percentage1Controller,
                onChanged: (input) => data['percentage1'] = input),
            _buildInputWidget(
                label: 'percentage2',
                tc: _percentage2Controller,
                onChanged: (input) => data['percentage2'] = input),
            _buildInputWidget(
                label: 'percentage3',
                tc: _percentage3Controller,
                onChanged: (input) => data['percentage3'] = input),
            _buildInputWidget(
                label: 'number_bot',
                tc: _numberBotController,
                onChanged: (input) => data['number_bot'] = input),
            // _buildInputWidget(
            //     label: 'plan_desc',
            //     tc: _planDescController,
            //     onChanged: (input) => data['plan_desc'] = input),
            // _buildInputWidget(
            //     label: 'telegram_groups',
            //     tc: _telegramGroupsController,
            //     onChanged: (input) => data['telegram_groups'] = input),
          ],
        ),
      ),
    );
  }
}
