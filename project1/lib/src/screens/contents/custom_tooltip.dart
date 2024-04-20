import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class CustomTooltip extends StatelessWidget {
  const CustomTooltip({
    required this.content,
    Key? key,
  }) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: JustTheTooltip(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(content),
        ),
        preferredDirection: AxisDirection.up,
        child: Icon(
          Icons.info_outline,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
