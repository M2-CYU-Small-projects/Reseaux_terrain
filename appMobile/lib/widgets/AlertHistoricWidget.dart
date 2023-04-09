import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertHistoricWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlertElement();
}

class _AlertElement extends State<AlertHistoricWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 4,
                child: Text("11-12-22")
            ),
            Expanded(
                flex: 4,
                child: Text("Camera")
            ),
            Expanded(
                flex: 2,
                child: Text("OK")
            )

          ],
        ),
        Divider(
          height: 20,
          thickness: 1,
          indent: 5,
          endIndent: 5,
          color: Colors.grey,
        )
      ],
    );
  }
}
