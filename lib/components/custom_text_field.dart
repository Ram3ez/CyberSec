import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.isNum = true,
    this.iconFunction,
  });

  final String label;
  final bool isNum;
  final TextEditingController controller;
  final bool readOnly;
  final void Function()? iconFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType:
            isNum
                ? TextInputType.numberWithOptions(decimal: false)
                : TextInputType.text,
        cursorColor: Theme.of(context).primaryColor.withAlpha(200),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            child:
                isNum ? Icon(Icons.numbers) : Icon(Icons.text_snippet_outlined),
            onTap: () {
              iconFunction != null ? iconFunction!() : () {};
            },
          ),
          labelStyle: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.black),
          label: Text(label),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
