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
                          FlatButton(
                              onPressed: () {},
                              child: Text(
                                  "${appdata.data[index]['name']} (${cities.length})")),
                          FlatButton(
                              onPressed: () {},
                              child: const Text("Ver cidades"))
                        ],
                      ),
                      Container(
                        height: 130,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cities.length,
                          itemBuilder: (cityContext, cityIndex) {
                            return CityBox(
                                data: cities[cityIndex], onTap: () {});
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