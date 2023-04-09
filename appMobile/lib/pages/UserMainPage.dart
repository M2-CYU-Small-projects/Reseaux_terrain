import 'package:appmobilertt/utils/ApplicationState.dart';
import 'package:appmobilertt/widgets/AlarmControlWidget.dart';
import 'package:appmobilertt/widgets/CaptorStateWidget.dart';
import 'package:appmobilertt/widgets/ServerStatusWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/RoomWidget.dart';

class UserMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon système d'alarme"),
        centerTitle: true,
        actions: [
          ServerStatusWidget()
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          RichText(
              text: TextSpan(
                  text: "Etat actuel du système",
                  style: TextStyle(color: Colors.black, fontSize: 25))),
          RoomWidget(),
          Text("Dernier refresh : 11h12"),
          AlarmControlWidget(),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              CaptorStateWidget(
                captorName: "Camera",
                currentState: "On",
              ),
              CaptorStateWidget(
                captorName: "Porte",
                currentState: "Off",
              ),
              CaptorStateWidget(
                captorName: "Luminosité",
                currentState: "On",
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/captorValue');
            },
            child: Text("Détail de l'état de mon système"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alert');
              },
              child: Text("Alerte (ca vire après ca )")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alert');
              },
              child: Text("Notif alerte (ca vire après ca )"))

        ],
      ),
    );
  }
}
