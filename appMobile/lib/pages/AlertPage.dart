import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/AutomaticAlertWidget.dart';
import '../widgets/CaptorValueWidget.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALERTE"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
                child: RichText(
              text: const TextSpan(
                  text: "ALERTE !",
                  style: TextStyle(color: Colors.red, fontSize: 25)),
            )),
            Image.asset('images/room_atelierrt.png'),
            CaptorValueWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //Center Row contents horizontally,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Fausse Alerte"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Confirmer l'alerte"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            AutomaticAlertWidget()
          ],
        ),
      ),
    );
  }
}
