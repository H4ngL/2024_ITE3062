import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton(
      {super.key, required this.initialValue, required this.onChanged});

  final bool initialValue;
  final ValueChanged<bool> onChanged;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: Container(
        width: 46,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _value ? Colors.blue : Colors.grey.withOpacity(0.5),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
