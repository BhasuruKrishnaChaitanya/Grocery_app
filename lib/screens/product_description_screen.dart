import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Products.dart';
import 'package:grocery_app/widgets/weight_dropdown.dart';
import 'package:provider/provider.dart';

class ProductDescriptionScreen extends StatefulWidget {
  static const String routerName = "productDesc";
  @override
  _ProductDescriptionScreenState createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  @override
  
    String selected = "100";
    var weight = ['100', '200', '300'];
    changeSel(val) {
      print(val);
      setState(() {
        selected = val;
      });
    }
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    var product = Provider.of<ProductsProvider>(context).findProduct(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Container(
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: Image.network(
                "https://images-na.ssl-images-amazon.com/images/I/815XvUgtHHL._SX425_.jpg",
              ),
            ),
            WeightDropDown(weight, selected, changeSel),
            RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text("ADD TO CART"),
                    onPressed: () {},
                  ),
          ],
        ),
      ),
    );
  }
}
