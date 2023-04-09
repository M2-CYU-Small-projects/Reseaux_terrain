import 'dart:async';

import 'package:flutter/cupertino.dart';

class AutomaticAlertWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AutomaticAlertState();



}

class AutomaticAlertState extends State<AutomaticAlertWidget>{


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("10 "),
        Text("s avant le déclenchement auto ...")
      ],
    );
  }

}