import 'package:flutter/material.dart';

class RaisedCircularButton extends StatelessWidget {

  final String label;
  final Function onPressed;

  RaisedCircularButton({@required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.greenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}