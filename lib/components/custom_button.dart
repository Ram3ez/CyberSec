import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPress});

  final String label;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor.withAlpha(180),
      height: 40,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      onPressed: onPress,
      child: Text(label, style: GoogleFonts.aBeeZee(fontSize: 18)),
    );
  }
}
