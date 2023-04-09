import 'package:appmobilertt/network/HttpDriver.dart';
import 'package:appmobilertt/widgets/ServerStatusWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConnexionPage extends StatelessWidget {
  HttpDriver httpDriver = HttpDriver();
  final id = TextEditingController();
  final password = TextEditingController();

  String getRoute(String userType){
    if(userType == "USER"){
      return '/user';
    }
    else if(userType == "ADMIN"){
      return '/admin';
    }else{
      throw Exception;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarme"),
        centerTitle: true,
        actions: [
         ServerStatusWidget()
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: id,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Votre identifiant"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Votre mot de passe"),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    bool isConnected = await httpDriver.connect(
                        id.text, password.text, context);
                    if (isConnected) {
                      String userType = await httpDriver.getUserType(context);
                      String route = getRoute(userType);
                      Navigator.pushNamed(context, route);
                    }
                  } catch (e) {
                    print(e);
                    Fluttertoast.showToast(
                        msg: "Impossible de se connecter",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text("Se Connecter"))
          ],
        ),
      ),
    );
  }
}
