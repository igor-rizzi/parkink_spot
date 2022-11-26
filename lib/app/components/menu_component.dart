import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/register_screen.dart';

Widget Menu(BuildContext context) {
  String profileImage = 'assets/imagens-moedas/brl.png';

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.green),
          margin: EdgeInsets.only(bottom: 10.0),
          currentAccountPicture: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,

                    image:
                    NetworkImage(profileImage))),
          ),
          accountName: new Container(
              child: Text(
                'Igor',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          accountEmail: new Container(
              child: Text(
                'igor@igao.com',
                style: TextStyle(color: Colors.white),
              )),
        ),
        ListTile(
          title: const Text('Home Page'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(title: 'My Home Page'))
            );
          },
        ),
        ListTile(
          title: const Text('Register Page'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterPage(title: 'Register Page'))
            );
          },
        )
      ],
    ),
  );
}