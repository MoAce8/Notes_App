import 'package:flutter/material.dart';

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

///////////////////////////////////////////////////////////

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double keyboardHeight(context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

const kNotesBox = 'notes_box';