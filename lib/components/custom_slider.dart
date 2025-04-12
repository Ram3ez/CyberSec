import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider({
    super.key,
    required this.sliderValue,
    required this.label,
    required this.onChanged,
  });
  double sliderValue;
  final String label;

  Function(double value) onChanged;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.78,
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
              value: widget.sliderValue,
              min: 0,
              max: 1000,
              divisions: 1000,
              onChanged: widget.onChanged,
            ),
          ),
          Text(
            "${widget.label}: ${widget.sliderValue.toStringAsFixed(0)}",
            style: GoogleFonts.aBeeZee(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
