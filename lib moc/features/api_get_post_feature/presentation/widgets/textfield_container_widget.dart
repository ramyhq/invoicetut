import 'package:flutter/material.dart';

class TextFieldContainerWidget extends StatelessWidget {
   TextFieldContainerWidget({
    super.key,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.hintText,
    this.borderRadius = 10,
    this.color,
    this.iconClickEvent,
    this.onChanged,
  });

  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final String? hintText;
  final double? borderRadius;
  final Color? color;
  final VoidCallback? iconClickEvent;
  void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color ?? Colors.blueAccent.withOpacity(.2),
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: InkWell(
            onTap: iconClickEvent,
            child: Icon(prefixIcon!),
          ),
        ),
      ),
    );
  }
}
