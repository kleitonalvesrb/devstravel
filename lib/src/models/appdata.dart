import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    Uri uri = Uri.parse('https://api.b7web.com.br/flutter1wb/');
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      // print(res.body);
      setData(jsonDecode(res.body));
      return true;
    } else {
      return false;
    }
    return false;
  }
}
