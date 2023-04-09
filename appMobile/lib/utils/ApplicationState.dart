import 'package:flutter/cupertino.dart';

class ApplicationState extends ChangeNotifier{
  //ApplicationState({required this.token});

  late String token;
  late String role;
  late CaptorState cameraState;
  late CaptorState luminosityState;
  late CaptorState doorState;

  void updateToken(String token){
    this.token = token;
    notifyListeners();
  }

  void updateRole(String role){
    this.role = role;
    notifyListeners();
  }

  void updateCamera(CaptorState state){
    cameraState = state;
    notifyListeners();
  }

  void updateLuminosity(CaptorState state){
    luminosityState = state;
    notifyListeners();
  }

  void updateDoor(CaptorState state){
    doorState = state;
    notifyListeners();
  }

}

class CaptorState {
  late String id;
  late String name;
  late bool isActive;
  late bool isAlert;
  late String currentValue;
}