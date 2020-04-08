import 'package:flutter/material.dart';
import 'package:tip_app/widgets/input_section.dart';
import 'package:tip_app/widgets/raised_circular_button.dart';

void main() => runApp(TipScreen());

class TipScreen extends StatefulWidget {
  @override
  _TipScreenState createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  int numPeople = 0;
  double billAmount = 0.0;
  double calculatedValue = 0.0;
  double percentValue = 0;

  List<RaisedCircularButton> percentButtons = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Center(
            child: Text(
              "Tip App",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InputSection(
                onChanged: (value) {
                  setState(() {
                    if (value == '') {
                      billAmount = 0;
                    } else {
                      billAmount = double.parse(value);
                      print(billAmount);
                    }
                    calculatedValue = billAmount + billAmount * percentValue;
                  });
                },
              ),
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
                      onPressed: () {
                        setState(() {
                          percentValue = 0.1;
                          calculatedValue = billAmount + billAmount * percentValue;
                        });
                      },
                    ),
                    RaisedCircularButton(
                      onPressed: () {
                        setState(() {
                          percentValue = 0.15;
                          calculatedValue = billAmount + billAmount * percentValue;
                        });
                      },
                      label: '15%',
                    ),
                    RaisedCircularButton(
                      onPressed: () {
                        setState(() {
                          percentValue = 0.2;
                          calculatedValue = billAmount + billAmount * percentValue;
                        });
                      },
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
              Text('Split'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      setState(() {
                        numPeople = numPeople > 0 ? numPeople - 1 : 0;
                      });
                    },
                    color: Colors.green,
                    icon: Icon(
                      Icons.remove,
                    ),
                  ),
                  Text(
                    numPeople.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        numPeople++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text('Total per Person'),
                    Text('\$${calculatedValue.toStringAsFixed(2)}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('bill'),
                            Text('\$37'),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('tip'),
                            Text('\$7.5'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
