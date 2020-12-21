import 'package:flutter/material.dart';

class Product {
  String imagesrc;
  String name;
  String id;
  Product({this.imagesrc, this.name, this.id});
}

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(imagesrc: '1.png', name: 'Kurkure', id: '1'),
    Product(imagesrc: '2.png', name: 'b', id: '2'),
    Product(imagesrc: '3.png', name: 'c', id: '3'),
    Product(imagesrc: '4.png', name: 'd', id: '4'),
    Product(imagesrc: '4.png', name: 'd', id: '5'),
    Product(imagesrc: '4.png', name: 'd', id: '6'),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product findProduct(id) {
    print(id);
    return _products.where((element) => element.id == id).toList()[0];
  }
}
