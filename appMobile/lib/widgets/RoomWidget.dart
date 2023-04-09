import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RoomState();

}

class _RoomState extends State<RoomWidget>{



  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(
          height: 250.0,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/room_atelierrt.png'))),
        child: Stack(
          children: [
            Positioned(
                right: 5,
                bottom: 190,
                child: Icon(
                  Icons.videocam,
                  color: Colors.red,
                  size: 50,
                )),
            Positioned(
                right: 230,
                bottom: 10,
                child: Icon(
                  Icons.smart_button,
                  color: Colors.green,
                  size: 50,
                )),
            Positioned(
                right: 150,
                bottom: 20,
                child: Icon(
                  Icons.wb_twighlight,
                  color: Colors.red,
                  size: 50,
                ))
          ],
        ));
  }

}



