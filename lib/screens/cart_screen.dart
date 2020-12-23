import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';
import '../providers/Cart.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: cart.items.keys.length == 0
                  ? Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        "Cart is Empty!!",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItemWidget(cart.items.values.toList()[index],
                            cart.items.keys.toList()[index]);
                      },
                      itemCount: cart.items.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
