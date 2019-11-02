import 'dart:math';

import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({Key key, this.onPressed, this.child}) : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.green,
        child: widget.child,        
        onPressed: widget.onPressed,
      ),
    );
  }
}
