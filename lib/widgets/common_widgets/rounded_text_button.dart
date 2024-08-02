import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const RoundedTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          key: key,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: color ?? const Color(0xFF12A633),
            foregroundColor: Colors.white,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
