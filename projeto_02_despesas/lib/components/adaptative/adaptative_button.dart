import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return CupertinoButton(
        color: Theme.of(context).primaryColor,
        child: Text(this.label),
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
      );
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).textTheme.button.color,
      child: Text(this.label),
      onPressed: this.onPressed,
    );
  }
}
