import 'package:flutter/material.dart';

class Button extends StatelessWidget {
 final String text;
 final  void Function()? onPressed;

    Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.black),
        onPressed:onPressed,
        child: Text(
          "$text".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ));
  }
}
