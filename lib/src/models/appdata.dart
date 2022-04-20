import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];
  var favorites = [];

  bool hasFavorite(String cityName) {
    return favorites.contains(cityName);
  }

  List favoritesCities() {
    List result = [];
    for (var favorite in favorites) {
      var foundCities = this.searchCity(favorite);
      if (foundCities.length > 0) {
        result.add(foundCities[0]);
      }
    }
    return result;
  }

  List searchCity(text) {
    List result = [];
    text = text.trim().toLowerCase();
    print(text);

    if (text == '') {
      return result;
    }
    for (var continents in data) {
      // print(continents);
      for (var country in continents['countries']) {
        for (var city in country['cities']) {
          if (city['name'].toLowerCase().contains(text)) {
            result.add(city);
          }
        }
      }
    }

    return result;
  }

  bool favorite(String cityName) {
    if (hasFavorite(cityName)) {
      favorites.remove(cityName);
      return false;
    } else {
      favorites.add(cityName);
      return true;
    }
  }

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
