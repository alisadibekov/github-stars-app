import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String text;
  final Color color;

  const BadgeWidget({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
