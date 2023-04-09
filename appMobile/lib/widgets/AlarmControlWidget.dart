import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmControlWidget extends StatefulWidget {
  const AlarmControlWidget({super.key});


  @override
  State<StatefulWidget> createState() => _AlarmControl();


}

class _AlarmControl extends State<AlarmControlWidget> {

  bool isActivated = false;
  MaterialColor color = Colors.green;
  bool switchActivation(){
    return !isActivated;
  }

  String getText(){
    if(isActivated){
      return "Desactiver";
    }
    return "Activer";
  }

  MaterialColor switchContent() {
    if (isActivated) {
      return Colors.red;
    }
    return Colors.green;

  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isActivated = switchActivation();
          color = switchContent();
        });

      },
      child: Text(getText()),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
    );
  }
}
