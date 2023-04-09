import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:appmobilertt/utils/ApplicationState.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:provider/provider.dart';

class HttpDriver {
  late http.Client client;
  // String serverAdress = "10.77.46.39:8080";
  String serverAdress = "10.77.70.116:8080";

  HttpDriver() {
    client = http.Client();
  }

  http.Client getClient() {
    return client;
  }

  Map<String, String> getHeaders(BuildContext context){
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
      Provider.of<ApplicationState>(context, listen: false).token
    };
  }

  Future<bool> checkConnection() async {
    var url = Uri.http(serverAdress, "/health/");
    return client
        .get(url)
        .timeout(Duration(seconds: 1))
        .then((value) => value.statusCode == 200)
        .catchError((onError) => false);
  }

  Future<bool> connect(String id, String password, BuildContext context) async {
    var url = Uri.http(serverAdress, "/auth/login");
    var body = json.encode({'name': id, 'password': password});
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    // var url = await Uri.http('192.168.0.48:8080', '/auth/login', {'name': id, 'password' : password});
    var response = await client.post(url, body: body, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      Provider.of<ApplicationState>(context, listen: false)
          .updateToken(jsonResponse['token']);
      return true;
    }
    return false;
  }

  Future<String> getUserType(BuildContext context) async {
    var url = Uri.http(serverAdress, "/users/me/");
    Map<String, String> headers = getHeaders(context);
    var response =
        await client.get(url, headers: headers).timeout(Duration(seconds: 1));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Provider.of<ApplicationState>(context, listen: false)
          .updateRole(jsonResponse['role']);
      return jsonResponse['role'];
    }
    return "None";
  }

  Future<void> updateCaptorState(BuildContext context) async {}

  void closeClient() {
    client.close();
  }
}
