import "package:flutter/material.dart";

// ignore: must_be_immutable
class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    super.key,
    required this.curVal,
    required this.onChange,
    required this.label,
    this.centered = false,
  });

  bool curVal;
  String label;
  bool centered;
  void Function(bool val) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment:
            centered ? MainAxisAlignment.center : MainAxisAlignment.start,
        spacing: 10,
        children: [
          Switch(
            activeColor: Theme.of(context).primaryColor,
            activeTrackColor: Theme.of(context).primaryColor.withAlpha(70),
            inactiveThumbColor: Colors.white,
            value: curVal,
            onChanged: onChange,
          ),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
