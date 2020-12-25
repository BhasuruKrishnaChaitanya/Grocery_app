import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_app/providers/Cart.dart';
import 'package:grocery_app/providers/Products.dart';
import 'package:grocery_app/providers/categories.dart';
import 'package:grocery_app/widgets/weight_dropdown.dart';
import 'package:provider/provider.dart';

class ProductDescriptionScreen extends StatefulWidget {
  static const String routerName = "productDesc";
  @override
  _ProductDescriptionScreenState createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  // String selected = 0;
    var selected = 0;

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    var product = Provider.of<ProductsProvider>(context).findProduct(id);
    var category = Provider.of<CategoriesProvider>(context);
    var cart = Provider.of<Cart>(context);
    var weight = product.quantity;
    changeSel(val) {
      print(val);
      setState(() {
        selected = val;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${category.getCatName(product.categoryid)} : ${product.name}",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.imagesrc,
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
                          width: MediaQuery.of(context).size.width * 0.32,
                          // height: 2,
                          // color: Colors.amber[colorCodes[index]],
                          child: Center(
                              child: selected == index
                                  ? Container(
                                      child: FlatButton(
                                        color: Theme.of(context).primaryColor,
                                        onPressed: () {
                                          changeSel(index);
                                        },
                                        child: Text(
                                          '${weight[index]}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : OutlineButton(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        changeSel(index);
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
                  child:cart.particularItemCount(product.id) == 0
            ? Padding(
                padding: const EdgeInsets.only(top:8.0),
                
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text("ADD TO CART"),
                    onPressed: () {
                      cart.addToCart(
                          product.id, product.name, weight[selected]);
                      // Scaffold.of(context).hideCurrentSnackBar();
                      // Scaffold.of(context).showSnackBar(SnackBar(
                      //   content: Text("Item Added to Cart"),
                      //   duration: Duration(seconds: 2),
                      //   action: SnackBarAction(
                      //     label: "UNDO",
                      //     onPressed: () {
                      //       cart.removeFromCart(product.id);
                      //     },
                      //   ),
                      // ));
                    },
                  ),
                
              )
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(
                    children: [
                      Container(
                        width: 50,
                        child: FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            cart.removeFromCart(product.id);
                          },
                          child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          cart.particularItemCount(product.id).toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Container(
                        width: 50,
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            cart.addToCart(
                                product.id, product.name, weight[selected]);
                          },
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
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
