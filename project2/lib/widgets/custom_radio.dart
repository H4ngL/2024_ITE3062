import 'package:flutter/material.dart';
import 'package:project2/theme/colors.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final List options;
  final int value;
  final Function(int?) onChanged;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.options
          .asMap()
          .entries
          .map(
            (entry) => CustomRadioItem(
              label: entry.value,
              value: entry.key,
              groupValue: widget.value,
              onChanged: widget.onChanged,
            ),
          )
          .toList(),
    );
  }
}

class CustomRadioItem extends StatelessWidget {
  const CustomRadioItem({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String label;
  final int value;
  final int groupValue;
  final Function(int?) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      fillColor: MaterialStateProperty.all(ColorStyles.darkPointColor),
      title: Text(label),
    );
  }
}
