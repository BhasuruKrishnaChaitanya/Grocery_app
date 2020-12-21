import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Products.dart';
import 'package:grocery_app/screens/product_description_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() => runApp(_MyAppState());

class _MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx)=>ProductsProvider())],
          child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.deepPurple,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
        routes: {
          ProductDescriptionScreen.routerName:(ctx)=>ProductDescriptionScreen(),
        },
      ),
    );
  }
}
