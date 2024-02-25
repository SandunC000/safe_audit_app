import 'package:flutter/material.dart';

Widget buildTextButton(String option, String selectedOption, Function(String) onPressed) {
  return TextButton(
    onPressed: () {
      onPressed(option);
    },
    child: Container(
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selectedOption == option ? Colors.white : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        option,
        style: TextStyle(
          color: selectedOption == option ? Colors.white : Colors.white.withOpacity(0.7),
        ),
      ),
    ),
  );
}
