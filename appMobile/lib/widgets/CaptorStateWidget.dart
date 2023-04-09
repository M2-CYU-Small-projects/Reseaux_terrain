import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaptorStateWidget extends StatefulWidget {
  const CaptorStateWidget(
      {super.key, required this.captorName, required this.currentState});

  final String captorName;
  final String currentState;

  @override
  State<StatefulWidget> createState() => _CaptorState();

  MaterialColor getColor(String text) {
    if (text == "On") {
      return Colors.green;
    }
    return Colors.red;
  }
}

class _CaptorState extends State<CaptorStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(widget.captorName),
              )),
          Expanded(
              flex: 2,
              child: RichText(
                text: TextSpan(
                    text: widget.currentState,
                    style:
                        TextStyle(color: widget.getColor(widget.currentState))),
              ))
        ],
      ),
      Divider(
        height: 20,
        thickness: 1,
        indent: 5,
        endIndent: 5,
        color: Colors.grey,
      )
    ]);
  }
}
