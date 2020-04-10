import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TipDialog {
  Future<String> createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              'Custom Tip',
              style: TextStyle(color: Colors.greenAccent),
            ),
            content: TextField(
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              controller: customController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(right: 10),
                hintText: '0',
                hintStyle: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.greenAccent,
                  ),
                ),
                suffixIcon: FaIcon(
                  FontAwesomeIcons.percent,
                  color: Colors.greenAccent,
                  size: 40,
                ),
              ),
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.greenAccent),
                ),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              )
            ],
          );
        });
  }
}
