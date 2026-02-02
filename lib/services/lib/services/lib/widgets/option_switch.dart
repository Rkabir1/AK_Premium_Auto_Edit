import 'package:flutter/material.dart';

class OptionSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const OptionSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
