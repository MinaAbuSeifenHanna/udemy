import 'package:flutter/material.dart';

class TextFormFieldAuth extends StatelessWidget {
  TextFormFieldAuth(
      {super.key,
      required this.textController,
      required this.labelText,
      this.prefix,
      this.suffix,
      this.obscure,
      required this.valid});

  final TextEditingController textController;

  final String labelText;

  Widget? prefix;

  Widget? suffix;

  bool? obscure;

  final FormFieldValidator<String>? valid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: textController,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        label: Text(labelText),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
