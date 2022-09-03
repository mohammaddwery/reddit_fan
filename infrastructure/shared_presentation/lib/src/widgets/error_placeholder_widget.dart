import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';

class ErrorPlaceholderWidget extends StatelessWidget {
  final String message;
  ErrorPlaceholderWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: AppFonts.getSize18(context),
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
