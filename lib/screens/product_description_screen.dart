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
  var weight = ['100 gm', '200 gm', '300 gm', '400 gm', '500 gm'];
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Snacks: Kurkure',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      "https://images-na.ssl-images-amazon.com/images/I/815XvUgtHHL._SX425_.jpg",
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                ),
                // WeightDropDown(weight, selected, changeSel),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // padding: const EdgeInsets.all(8),
                      itemCount: weight.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.height * 0.12,
                          // height: 2,
                          // color: Colors.amber[colorCodes[index]],
                          child: Center(
                              child: OutlineButton(
                            borderSide: BorderSide(
                              color: Colors.indigo[600],
                            ),
                            onPressed: () {
                              print('Received click');
                            },
                            child: Text('${weight[index]}'),
                          )),
                        );
                      }),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hi Fins'),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text("ADD TO CART"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
