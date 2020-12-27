import 'package:flutter/material.dart';

class Product {
  String imagesrc;
  String name;
  String id;
  String categoryid;
  List<String> quantity;

  Product({this.imagesrc, this.name, this.id, this.categoryid, this.quantity});
}

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
        imagesrc:
            'https://images-na.ssl-images-amazon.com/images/I/815XvUgtHHL._SX425_.jpg',
        name: 'Kurkure',
        id: '1',
        categoryid: '1',
        quantity: ['10g', '20g', '30g']),
    Product(
        imagesrc:
            'https://images-na.ssl-images-amazon.com/images/I/81X7W2BrGaL._SX425_.jpg',
        name: 'Lays',
        id: '2',
        categoryid: '1',
        quantity: ['10g', '20g', '30g']),
    Product(
        imagesrc:
            'https://cpimg.tistatic.com/05423910/b/4/High-Dart-Rice-Aata-packaging-Films.jpg',
        name: 'Aata',
        id: '3',
        categoryid: '2',
        quantity: ['500g', '1kg', '2kg', '5kg']),
    Product(
        imagesrc:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCfSZq29j5XnjkdASjWbTXX9_g4C2sILvt4g&usqp=CAU',
        name: 'Sugar',
        id: '4',
        categoryid: '2',
        quantity: ['500g', '1kg', '2kg', '5kg']),
    Product(
        imagesrc:
            'https://images-na.ssl-images-amazon.com/images/I/61n1hm72dlL._SL1000_.jpg',
        name: 'Salt',
        id: '5',
        categoryid: '2',
        quantity: ['500g', '1kg']),
    Product(
        imagesrc:
            'https://www.jiomart.com/images/product/420x420/490830932/tata-sampann-high-protein-unpolished-tur-arhar-dal-1-kg-0-20200910.jpg',
        name: 'Toor dal',
        id: '6',
        categoryid: '2',
        quantity: ['500g', '1kg', '2kg']),
    Product(
        imagesrc:
            'https://images-static.nykaa.com/media/catalog/product/tr:h-800,w-800,cm-pad_resize/9/7/97e75ae42204091new.jpg',
        name: "Nivea cream",
        id: '7',
        categoryid: '3',
        quantity: ['50g', '100g', '240g']),
    Product(
        imagesrc:
            'https://thumbs.dreamstime.com/b/pepsi-tin-can-pula-croatia-march-l-isolated-white-background-carbonated-soft-drink-produced-manufactured-pepsico-113714247.jpg',
        name: 'pepsi',
        id: '8',
        categoryid: '4',
        quantity: ['250ml', '500ml', '1l']),
  ];

  List<Product> get products {
    return [..._products];
  }

  Product findProduct(id) {
    print(id);
    return _products.where((element) => element.id == id).toList()[0];
  }

  List<Product> getProductsByCat(id) {
    return _products.where((element) => element.categoryid == id).toList();
  }

  List<Product> searchProducts(String term) {
    
    return term.length==0?[]:_products.where((element) => element.name.toLowerCase().startsWith(term.toLowerCase())).toList();
  }
}
