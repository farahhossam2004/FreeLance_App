import 'package:flutter/material.dart';

class Customslider extends StatefulWidget {
  final String text;
  final double screenwidth;
  final double currentSliderValue;
  final double min;
  final double max;
  final ValueChanged<double> onChanged; // Add this to handle the change

  const Customslider({
    super.key,
    required this.text,
    required this.currentSliderValue,
    required this.screenwidth,
    required this.max,
    required this.min,
    required this.onChanged, // Initialize in constructor
  });

  @override
  State<Customslider> createState() => _CustomsliderState();
}

class _CustomsliderState extends State<Customslider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: widget.screenwidth / 2,
          child: Slider(
            value: widget.currentSliderValue,
            min: widget.min,
            max: widget.max,
            divisions: 60,
            label: widget.currentSliderValue.toString(),
            onChanged: (double value) {
              widget.onChanged(value); // Trigger callback to notify the parent
            },
          ),
        ),
      ],
    );
  }
}
