import 'package:appmobilertt/widgets/ServerStatusWidget.dart';
import 'package:control_pad/views/joystick_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaptorDetailsUserPage extends StatelessWidget{

  void getValue(
      double degrees, double distance){
    // print(degrees.toString() + " --- "+distance.toString() );
    // control.setDirection(distance*cos( (degrees*PI)/180 ), distance*sin( (degrees*PI)/180));
    print(degrees.toString() + " " + distance.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes capteurs"),
        centerTitle: true,
        actions: [
          ServerStatusWidget(),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Column(
              children: [
                Image.asset('images/room_atelierrt.png'),
                SizedBox(height: 25,),
                Text("Luminosité : 140"),
                Text("Porte : Fermée"),
                SizedBox(height: 25,)
              ],
            ),
            JoystickView(
              onDirectionChanged: getValue,
              interval: Duration(milliseconds: 100),
            )
          ],
        ),
      ),
    );
  }

}

