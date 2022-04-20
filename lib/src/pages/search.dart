import 'package:devstravel/src/partials/citybox.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  var list = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void doSearch(pageContext, text) async {
    print(text);
    var newList =
        await Provider.of<AppData>(pageContext, listen: false).searchCity(text);
    setState(() {
      list = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                  scaffoldKey: _scaffoldKey,
                  pageContext: context,
                  title: 'Busque uma cidade',
                  hideSearch: true),
              drawer: CustomDrawer(pageContext: context),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (text) {
                        doSearch(context, text);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Digiete o nome de uma cidade',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      // padding: const EdgeInsets.only(bottom: 0),
                      // shrinkWrap: true,
                      crossAxisCount: 2,
                      // childAspectRatio: 10 / 11,
                      children: List.generate(list.length, (index) {
                        return CityBox(
                          data: list[index],
                          onTap: (cityData) {
                            Navigator.pushNamed(context, '/city',
                                arguments: cityData);
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ));
  }
}
