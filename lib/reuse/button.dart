import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonradius;

  const ReusableButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.black,
    this.buttonHeight = 50.0,
    this.buttonWidth = 10.0,
    this.buttonradius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonradius),
          )
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}