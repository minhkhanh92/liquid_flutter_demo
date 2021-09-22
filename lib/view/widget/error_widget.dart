import 'package:flutter/material.dart';

class ErrorViewWidget extends StatelessWidget {
  final String message;
  final Function onRetry;

  ErrorViewWidget({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
