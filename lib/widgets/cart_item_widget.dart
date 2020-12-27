import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final String itemKey;
  CartItemWidget(this.item, this.itemKey);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      key: ValueKey(itemKey),
      background: Container(
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeAllFromCart(itemKey);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure?",textAlign: TextAlign.center,),
                  content: Text("Do you want to delete the item from Cart?"),
                  
                  actions: [
                    RaisedButton(color: Theme.of(context).accentColor, onPressed: ()=>Navigator.of(context).pop(false), child: Text("No",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),)),
                    SizedBox(width: 20,),
                    RaisedButton(color: Theme.of(context).accentColor,onPressed: ()=>Navigator.of(context).pop(true), child: Text("Yes",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)))
                  ],
                ));
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  item.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                "${item.quantity}",
                style: Theme.of(context).textTheme.headline6,
              ),
              Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            cart.removeFromCart(itemKey);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5)),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            margin: EdgeInsets.all(0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            width: 30,
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(0),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.5, horizontal: 8),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 1.5)),
                                          child: FittedBox(
                                            child: Text(
                                              cart
                                                  .particularItemCount(
                                                      itemKey)
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            cart.addToCart(
                                                itemKey,
                                                item.title,
                                                item.quantity);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            margin: EdgeInsets.all(0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 3),
                                            width: 30,
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
      ),
    );
  }
}