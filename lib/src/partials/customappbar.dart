import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

PreferredSizeWidget CustomAppBar({
  GlobalKey<ScaffoldState> ?scaffoldKey,
  BuildContext ?pageContext,
  String title = '',
  bool hideSearch = false,
  bool showBack = false
}) {

 void searchAction(){
   Navigator.pushReplacementNamed(pageContext!, '/search');
 }

  IconButton drawerIcon = IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        scaffoldKey!.currentState!.openDrawer();
      },
    );

  IconButton backIcon = IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30,
      ),
      onPressed: () {
        Navigator.pop(pageContext!);

      },
    );  

  IconButton leadingButton  = showBack ? backIcon : drawerIcon;
 

  return AppBar(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title:  Text(
      title,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),
    leading: leadingButton,
    actions: [
      !hideSearch ? IconButton(
        onPressed:searchAction,
        icon: const Icon(
          Icons.search,
          color: Colors.black,
          size: 30,
        ),
      ) : Container()
    ],
  );
}
