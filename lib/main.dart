import 'package:devstravel/src/pages/listcity.dart';
import 'package:devstravel/src/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';
import 'src/pages/preload.dart';
import 'src/pages/continente.dart';
import 'src/pages/home.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppData()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/preload': (context) => PreloadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentePage(),
        '/ListCity' : (context) => ListCityPage()
      },
      initialRoute: '/preload',
    );
  }
}
