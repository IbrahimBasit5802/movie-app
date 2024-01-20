import 'package:flutter/material.dart';

class CustomActionChip extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;

  const CustomActionChip(
      {super.key,
      required this.label,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      side: BorderSide.none,
      color: MaterialStateProperty.all(color),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      label: Text(
        label,
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w600, color: textColor),
      ),
      onPressed: () {},
    );
  }
}
