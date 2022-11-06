import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText(
      {Key? key,
      this.onTap,
      required this.color,
      required this.actionTitle,
      required this.questionTitle})
      : super(key: key);
  final VoidCallback? onTap;
  final Color color;
  final String questionTitle;
  final String actionTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionTitle,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
              // decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ));
  }
}
