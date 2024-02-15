import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.width = double.infinity,
    this.background = Colors.cyan,
    this.isUperCase = false,
    required this.text,
    required this.function,
    this.isLoading = false,
  });

  final double width;
  final Color background;
  final bool isUperCase;
  final String text;
  final VoidCallback function;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(12)),
        width: width,
        height: screenHeight(context) * 0.055,
        child: Center(
          child: isLoading
              ? SizedBox(
            height:screenWidth(context)*.07,
            width: screenWidth(context)*.07,
                child: const CircularProgressIndicator(
            color: Colors.black,
          ),
              )
              : Text(
                  isUperCase ? text.toUpperCase() : text,
                  style: TextStyle(
                      fontSize: screenWidth(context) * 0.046,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
        ),
      ),
    );
  }
}
