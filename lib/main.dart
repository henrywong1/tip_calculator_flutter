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
        backgroundColor: Colors.black,
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
          padding: EdgeInsets.all(35),
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
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text(
                        'Choose Tip',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedCircularButton(
                          label: '10%',
                          onPressed: () {
                            setState(() {
                              percentValue = 0.1;
                              calculatedValue =
                                  billAmount + billAmount * percentValue;
                            });
                          },
                        ),
                        RaisedCircularButton(
                          onPressed: () {
                            setState(() {
                              percentValue = 0.15;
                              calculatedValue =
                                  billAmount + billAmount * percentValue;
                            });
                          },
                          label: '15%',
                        ),
                        RaisedCircularButton(
                          onPressed: () {
                            setState(() {
                              percentValue = 0.2;
                              calculatedValue =
                                  billAmount + billAmount * percentValue;
                            });
                          },
                          label: '20%',
                        ),
                      ],
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
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 2),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Split',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 25
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              numPeople = numPeople > 0 ? numPeople - 1 : 0;
                            });
                          },
                          color: Colors.greenAccent,
                          icon: Icon(
                            Icons.remove,
                          ),
                        ),
                        Text(
                          numPeople.toString(),
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.greenAccent,
                          ),
                        ),
                        IconButton(
                          color: Colors.greenAccent,
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
                  ],
                ),
              ),
              Container(
                height: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  color: Colors.greenAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Total after Tip',
                        style: TextStyle(
                            fontSize: 25
                        ),
                      ),
                      Text(
                        '\$${calculatedValue.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Total per person',
                              ),
                              Text('\$37'),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('Tip Amount'),
                              Text('\$7.5'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
