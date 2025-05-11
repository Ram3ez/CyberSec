import "package:flutter/material.dart";

class CustomGridButton extends StatelessWidget {
  const CustomGridButton({
    super.key,
    required this.label,
    required this.onPress,
  });
  final String label;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.43,
      child: MaterialButton(
        color: Theme.of(context).primaryColor.withAlpha(180),
        height: MediaQuery.of(context).size.height * 0.25,
        //minWidth: MediaQuery.of(context).size.width * 0.45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onPressed: onPress,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
