import 'package:appmobilertt/pages/AdminMainPage.dart';
import 'package:appmobilertt/pages/AlertPage.dart';
import 'package:appmobilertt/pages/CaptorDetailsUserPage.dart';
import 'package:appmobilertt/pages/ConnexionPage.dart';
import 'package:appmobilertt/pages/DetailCaptorAdminPage.dart';
import 'package:appmobilertt/pages/UserMainPage.dart';
import 'package:appmobilertt/utils/ApplicationState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) =>
      runApp(
        ChangeNotifierProvider(
          create: (context) => ApplicationState(),
          child: MyApp(),
        ),
      ));

}

class MyApp extends StatelessWidget {
  MyApp({super.key, st});

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home: ConnexionPage(),
      initialRoute: '/',
      routes: {
        '/user' : (context) => UserMainPage(),
        '/alert' : (context) => AlertPage(),
        '/captorValue' : (context) => CaptorDetailsUserPage(),
        '/admin' : (context) => AdminMainPage(),
        '/detailCaptorAdmin' : (context) => DetailCaptorAdminPage()
      },
    );
  }
}
