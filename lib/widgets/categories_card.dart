import 'package:flutter/material.dart';
import '../providers/Products.dart';

class CategoriesCard extends StatelessWidget {
  final Product product;
  CategoriesCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          color: Colors.indigo,
          margin: EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Text(product.imagesrc,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    )),
                Text(product.name,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[800],
                    )),
              ],
            ),
          )),
    );
  }
}
