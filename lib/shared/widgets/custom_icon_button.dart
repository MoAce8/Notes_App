import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth(context) * 0.01),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.grey.withOpacity(.2)),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
