import 'package:flutter/material.dart';
import 'package:tip_app/constants.dart';

class InputSection extends StatelessWidget {
  final Function onChanged;

  InputSection({@required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Enter Bill Total',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 40),
          width: 170,
          child: TextField(
            onChanged: onChanged,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kColorTheme,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.greenAccent,
              )),
              hintText: 'Enter Amount',
              hintStyle: TextStyle(
                fontSize: 15,
              ),
              prefixIcon: Icon(
                Icons.attach_money,
                color: Colors.greenAccent,
              ),
            ),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ],
    );
  }
}
