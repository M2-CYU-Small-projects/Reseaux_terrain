import 'dart:async';

import 'package:appmobilertt/network/HttpDriver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServerStatusWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ServerStatus();

}

class _ServerStatus extends State<ServerStatusWidget>{
  HttpDriver client = HttpDriver();
  bool continueLoop = true;
  bool state = true;
  MaterialColor color = Colors.grey;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (t) async {
      if(!continueLoop){
        t.cancel();
      }
      else{
        state = await client.checkConnection();
        setState(() {
          color = getColor(state);
        });
      }
    });
  }

  @override
  void dispose() {
    continueLoop = false;
    super.dispose();
  }

  MaterialColor getColor(bool state){
    if(state){
      return Colors.green;
    }
    return Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.info, color: color);
  }
  
}