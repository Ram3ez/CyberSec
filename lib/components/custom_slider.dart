import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.sliderValue,
    required this.label,
    required this.onChanged,
    required this.minVal,
    required this.maxVal,
  });
  final double sliderValue;
  final String label;
  final double minVal;
  final double maxVal;

  final Function(double value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
                side: BorderSide(
                  color: Theme.of(context).primaryColor.withAlpha(255),
                ),
              ),
            ),

            child: Slider(
              thumbColor: Theme.of(context).primaryColor.withAlpha(255),
              activeColor: Theme.of(context).primaryColor,
              value: sliderValue,
              min: minVal,
              max: maxVal,
              divisions: maxVal.toInt(),
              onChanged: onChanged,
            ),
          ),
          Text(
            "$label: ${sliderValue.toStringAsFixed(0)}",
            style: GoogleFonts.aBeeZee(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
