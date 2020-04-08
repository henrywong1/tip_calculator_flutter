import 'package:flutter/material.dart';
import 'package:tip_app/widgets/raised_circular_button.dart';

class TipButtons extends StatelessWidget {
  final Function getPercent;
  TipButtons({@required this.getPercent});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Choose Tip',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedCircularButton(
                label: '10%',
                onPressed: () => getPercent('10'),
              ),
              RaisedCircularButton(
                label: '15%',
                onPressed: () {},
              ),
              RaisedCircularButton(
                onPressed: () {},
                label: '20%',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedCircularButton(
              onPressed: () {},
              label: '25%',
            ),
            RaisedCircularButton(
              onPressed: () {},
              label: 'Custom Tip',
            ),
          ],
        ),
      ],
    );
  }
}

