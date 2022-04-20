import 'package:devstravel/src/partials/citybox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';
import '../partials/customdrawer.dart';

class FavoritePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      List favoriteis = appdata.favoritesCities();
      print(favoriteis);
      return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Cidades Salvas',
            hideSearch: false),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: GridView.count(
          // padding: const EdgeInsets.only(bottom: 0),
          // shrinkWrap: true,
          crossAxisCount: 2,
          // childAspectRatio: 10 / 11,
          children: List.generate(favoriteis.length, (index) {
            return CityBox(
              data: favoriteis[index],
              onTap: (cityData) {
                Navigator.pushNamed(context, '/city', arguments: cityData);
              },
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