import 'package:flutter/material.dart';

class OptionSlider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;

  const OptionSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: value.toStringAsFixed(1),
      onChanged: onChanged,
    );
  }
}
