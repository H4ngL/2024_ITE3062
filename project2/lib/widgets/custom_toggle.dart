import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  final String title;
  final String content;

  const CustomToggle({super.key, required this.title, required this.content});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool _isExpanded = false;

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggle,
          child: Row(
            children: [
              Icon(_isExpanded ? Icons.arrow_drop_down : Icons.arrow_right),
              const SizedBox(width: 8),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 8.0),
            child: Text(widget.content),
          ),
      ],
    );
  }
}
