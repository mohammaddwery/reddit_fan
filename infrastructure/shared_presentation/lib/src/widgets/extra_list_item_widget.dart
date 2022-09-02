import 'package:flutter/material.dart';
import 'package:shared_presentation/shared_presentation.dart';

class ExtraListItemWidget extends StatelessWidget {
  final String message;
  ExtraListItemWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize??AppFonts.getSize18(context),
            fontWeight: FontWeight.w400,
            height: 1.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
