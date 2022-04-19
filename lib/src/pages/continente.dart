import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';
import '../partials/citybox.dart';

class ContinentePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void seeCityAction(context, continenteIndex) {
    print("continente index ${continenteIndex}");
    Navigator.pushNamed(context, '/ListCity', arguments: continenteIndex);
  }

  void cityBoxAction(cityData) {
    print(cityData['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                  scaffoldKey: _scaffoldKey,
                  pageContext: context,
                  title: 'Escolha um continente',
                  hideSearch: false),
              drawer: CustomDrawer(pageContext: context),
              backgroundColor: Colors.white,
              body: ListView.builder(
                itemCount: appdata.data.length,
                itemBuilder: (context, index) {
                  var cities = [];
                  for (var country in appdata.data[index]['countries']) {
                    cities.addAll(country['cities']);
                  }
                  // appdata.data[index]['name']
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Text(
                              "${appdata.data[index]['name']} (${cities.length})",
                              style: const TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                seeCityAction(context, index);
                              },
                              child: const Text(
                                "Ver cidades",
                                style: TextStyle(
                                    fontFamily: 'Helvetica Neue',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ))
                        ],
                      ),
                      Container(
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cities.length,
                          itemBuilder: (cityContext, cityIndex) {
                            return CityBox(
                                data: cities[cityIndex], onTap: cityBoxAction);
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ));
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