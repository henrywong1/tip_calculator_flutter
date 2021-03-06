import 'package:flutter/material.dart';
import 'package:tip_app/widgets/input_section.dart';
import 'package:tip_app/widgets/raised_circular_button.dart';
import 'package:tip_app/widgets/tip_dialog.dart';

void main() => runApp(TipScreen());

class TipScreen extends StatefulWidget {
  final String title;
  static final navKey = new GlobalKey<NavigatorState>();
  const TipScreen({Key navKey, this.title}) : super(key: navKey);
  @override
  _TipScreenState createState() => _TipScreenState();
}

class _TipScreenState extends State<TipScreen> {
  double customTipPercent = 0.0;
  int numPeople = 1;
  double billAmount = 0.0;
  double calculatedValue = 0.0;
  double percentValue = 0;
  double totalPerPerson = 0;

  List<RaisedCircularButton> percentButtons = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TipScreen.navKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15)
            ),
          ),
          backgroundColor: Colors.greenAccent,
          title: Center(
            child: Text(
              "Henry's Tip App",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [Container(
            padding: EdgeInsets.all(20),
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
                        padding: const EdgeInsets.all(25),
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
                                totalPerPerson = (calculatedValue / numPeople);
                              });
                            },
                          ),
                          RaisedCircularButton(
                            onPressed: () {
                              setState(() {
                                percentValue = 0.15;
                                calculatedValue =
                                    billAmount + billAmount * percentValue;
                                totalPerPerson = (calculatedValue / numPeople);
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
                                totalPerPerson = (calculatedValue / numPeople);
                              });
                            },
                            label: '20%',
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedCircularButton(
                            onPressed: () {
                              setState(() {
                                percentValue = 0.25;
                                calculatedValue =
                                    billAmount + billAmount * percentValue;
                                totalPerPerson = (calculatedValue / numPeople);
                              });
                            },
                            label: '25%',
                          ),
                          RaisedCircularButton(
                            onPressed: () {
                              final context = TipScreen.navKey.currentState.overlay.context;
                              TipDialog().createAlertDialog(context).then((onValue) {
                                customTipPercent = double.parse(onValue);
                                print(customTipPercent);
                                setState(() {
                                  percentValue = customTipPercent / 100;
                                  calculatedValue = billAmount + billAmount * percentValue;
                                  totalPerPerson = (calculatedValue / numPeople);
                                });
                              });
                            },
                            label: 'Custom Tip',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
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
                                numPeople = numPeople > 1 ? numPeople - 1 : 1;
                                totalPerPerson = (calculatedValue / numPeople);
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
                                totalPerPerson = (calculatedValue / numPeople);
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
                                  style: TextStyle(
                                    fontSize: 15
                                  ),
                                ),
                                Text(
                                    '\$${totalPerPerson.toStringAsFixed(2)}',
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text('Tip Amount'),
                                Text('\$${(billAmount * percentValue).toStringAsFixed(2)}'),
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
          )
          ],
        ),
      ),
    );
  }
}
