import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  TextForm({
    @required this.controller,
    @required this.textType,
    this.changed,
    this.onField,
    this.suffix,
    @required this.validator,
    @required this.label,
    @required this.prefix,
    this.password = false,
    this.pressed,
    this.onTap,
    this.isClick = true,
  });

  final TextEditingController? controller;
  final TextInputType? textType;
  final void Function(String)? changed;
  final void Function()? onTap;
  final void Function(String)? onField;
  final void Function()? pressed;
  final String? Function(String?)? validator;
  final String? label;
  final IconData? prefix;
  final IconData? suffix;
  final bool password;
  final bool isClick;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textType,
      controller: controller,
      onChanged: changed,
      onTap: onTap,
      enabled: isClick,
      obscureText: password,
      validator: validator,
      onFieldSubmitted: onField,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(onPressed: pressed, icon: Icon(suffix))
              : null),
    );
  }
}
