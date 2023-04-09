import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaptorValueWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CaptorValue();
}

class _CaptorValue extends State<CaptorValueWidget> {
  bool isAlertPhoto = false;
  bool isAlertLight = false;
  bool isAlertDoor = true;

  String getText(bool state) {
    if (state) {
      return "Alerte";
    }
    return "OK";
  }

  MaterialColor getColor(bool state) {
    if (state) {
      return Colors.red;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Photo : "),
            Text(getText(isAlertPhoto),
                style: TextStyle(color: getColor(isAlertPhoto)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Luminosité : "),
            Text(getText(isAlertLight),
                style: TextStyle(color: getColor(isAlertLight)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Porte : "),
            Text(getText(isAlertDoor),
                style: TextStyle(color: getColor(isAlertDoor)))
          ],
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
