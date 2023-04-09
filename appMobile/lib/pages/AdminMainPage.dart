import 'package:appmobilertt/widgets/CurrentStateAdminWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/AlertHistoricWidget.dart';
import '../widgets/ServerStatusWidget.dart';

class AdminMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vue administrateur"),
          centerTitle: true,
          actions: [ServerStatusWidget()],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Center(
                child: Text("Historique des intrusions",
                    style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      AlertHistoricWidget(),
                      AlertHistoricWidget(),
                      AlertHistoricWidget(),
                      AlertHistoricWidget(),
                      AlertHistoricWidget(),
                      AlertHistoricWidget(),
                      AlertHistoricWidget()
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Etat actuel du système', style: TextStyle(fontSize: 20)),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                children: [
                  CurrentStateAdminWidget(
                      currentState: "On", captorName: "Camera"),
                  CurrentStateAdminWidget(
                      currentState: "Off", captorName: "Luminosite"),
                  CurrentStateAdminWidget(
                      currentState: "On", captorName: "Porte"),
                ],
              )
            ],
          ),
        ));
  }
}
