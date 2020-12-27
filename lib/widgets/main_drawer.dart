import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                "MyApp",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
           
          ),
          SizedBox(height:10),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.logout,
              size: 30,
            ),
            title: Text(
              'Sign Out',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
      elevation: 4,
    );
  }
}
