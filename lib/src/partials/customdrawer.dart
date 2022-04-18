import 'package:flutter/material.dart';

Widget CustomDrawer({BuildContext? pageContext}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'DevsTravel',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue'),
                ),
                Text('versão 1.0',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Helvetica Neue')),
              ]),
          decoration: BoxDecoration(color: Colors.blue),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, "/home");
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.public,
            color: Colors.black,
          ),
          title: const Text('Escolher Continente'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, "/continent");
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: const Text('Buscar cidades'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, "/search");
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: const Text('Cidades Salvas'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, "/favorites");
          },
        ),
      ],
    ),
  );
}
