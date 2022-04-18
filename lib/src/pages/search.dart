import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';
import '../partials/customappbar.dart';

class SearchPage extends StatelessWidget {
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
                  title: 'Busque uma cidade',
                  hideSearch: true),
              drawer: CustomDrawer(pageContext: context),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [const Text('Página de busca')],
              )),
            ));
  }
}
