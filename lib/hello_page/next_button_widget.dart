import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const NextButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        backgroundColor: WidgetStatePropertyAll(Color(0xFF8875FF)),
      ),
      onPressed: onPressed,
      child: Text('NEXT', style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
