import 'package:flutter/material.dart';
import 'package:grocery_app/providers/categories.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';

class CategoriesCard extends StatelessWidget {
  final Category category;
  CategoriesCard({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          
          margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Colors.indigo[600],Colors.red[600]]),borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Text(category.name,
                  textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      )),
                  
                ],
              ),
            ),
          )),
    );
  }
}
