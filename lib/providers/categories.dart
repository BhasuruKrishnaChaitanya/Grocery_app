import 'package:flutter/material.dart';

class Category {
  String imagesrc;
  String name;
  String id;
  Category({this.imagesrc, this.name, this.id});
}

class CategoriesProvider with ChangeNotifier {
  List<Category> _categories = [
    Category(
        imagesrc:
            'https://images-na.ssl-images-amazon.com/images/I/815XvUgtHHL._SX425_.jpg',
        name: 'Snacks',
        id: '1'),
    Category(
        imagesrc:
            'https://cpimg.tistatic.com/05423910/b/4/High-Dart-Rice-Aata-packaging-Films.jpg',
        name: 'Food Grains and Flours',
        id: '2'),
    Category(
        imagesrc:
            'https://images-na.ssl-images-amazon.com/images/I/61n1hm72dlL._SL1000_.jpg',
        name: 'Skin Care and Beauty',
        id: '3'),
    Category(
        imagesrc:
            'https://www.jiomart.com/images/product/420x420/490830932/tata-sampann-high-protein-unpolished-tur-arhar-dal-1-kg-0-20200910.jpg',
        name: 'Beverages',
        id: '4'),
        Category(
        imagesrc:
            'https://www.jiomart.com/images/product/420x420/490830932/tata-sampann-high-protein-unpolished-tur-arhar-dal-1-kg-0-20200910.jpg',
        name: 'Beverages',
        id: '4'),
        Category(
        imagesrc:
            'https://www.jiomart.com/images/product/420x420/490830932/tata-sampann-high-protein-unpolished-tur-arhar-dal-1-kg-0-20200910.jpg',
        name: 'Beverages',
        id: '4'),
  ];

  List<Category> get categories {
    return [..._categories];
  }

  Category findCategory(id) {
    print(id);
    return _categories.where((element) => element.id == id).toList()[0];
  }

  String getCatName(id) {
    var cat = _categories.where((element) => element.id == id).toList()[0];
    return cat.name;
  }
}
