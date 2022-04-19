import 'package:devstravel/src/partials/citybox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class ListCityPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void cityBoxAction(cityData) {
    print(cityData['name']);
  }

  @override
  Widget build(BuildContext context) {
    final continenteIndex =
        ModalRoute.of(context)!.settings.arguments.toString();

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      var cities = [];
      for (var country in appdata.data[int.parse(continenteIndex)]
          ['countries']) {
        cities.addAll(country['cities']);
      }

      return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title:
                "${appdata.data[int.parse(continenteIndex)]['name']} (${cities.length} cidades)",
            hideSearch: false,
            showBack: true),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(cities.length, (index) {
            return CityBox(
              data: cities[index],
              onTap: cityBoxAction,
            );
          }),
        ),
      );
    });
  }
}

/*
Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(child: Text('Testando 1,2,3 .....')),
    );
    */