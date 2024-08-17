import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int index;
  final String label;
  final VoidCallback? onPressed;

  const CustomButton(
      {super.key,
      required this.index,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle;
    switch (index) {
      case 0:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan[400],
          foregroundColor: Colors.black,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
        break;
      case 1:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.cyan)),
        );
        break;
      case 2:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: BeveledRectangleBorder(
              // borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.cyan)),
        );
        break;
      case 3:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan[400],
          foregroundColor: Colors.black,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
        break;
      default:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan[400],
          foregroundColor: Colors.black,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
        break;
    }
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 16.0),
      ),
    );
  }
}
