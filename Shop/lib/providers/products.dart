import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'ULTRABOOST 4.0 DNA SHOES',
        description:
            ' Sock-like fit\n Lace closure\n Textile lining\n Boost midsole\n Weight 12 ounces (size 9)\n Midsole drop: 10 mm (heel 30.5 mm / forefoot 20.5 mm)\n Continental™ Better Rubber outsole\n Product code: GY8598',
        price: 144.00,
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/65d1eff64d0748aba16dad5c0099a6d3_9366/Ultraboost_4.0_DNA_Shoes_White_GY8598_01_standard.jpg'),
    Product(
        id: 'p2',
        title: 'DISNEY NMD_R1 SHOES',
        description:
            ' Lace closure\n Closed mesh upper\n BOOST midsole\n Rubber outsole\n Yarn in upper contains at least 50% Parley Ocean Plastic and 50% recycled polyester\n ©Disney\n Product code: GV7909',
        price: 160.99,
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fae3e52ccebe49029351adf000a1b67a_9366/Disney_NMD_R1_Shoes_Black_GV7909_01_standard.jpg'),
    Product(
        id: 'p3',
        title: 'NMD_R1 SHOES',
        description:
            ' Lace closure\n Textile upper\n Textile lining\n BOOST midsole\n Rubber outsole\n Yarn in upper contains at least 50% Parley Ocean Plastic and 50% recycled polyester\n Imported\n Product code: GW5679',
        price: 150.50,
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b6ff077465e143f3abcfadf8006cd607_9366/NMD_R1_Shoes_White_GW5679_01_standard.jpg'),
    Product(
        id: 'p4',
        title: 'RACER TR21 SHOES',
        description:
            ' Lace closure\n Leather and textile upper\n Soft feel\n Cloudfoam midsole\n Textile lining\n Rubber outsole\n Product code: GY3682',
        price: 53.99,
        imageUrl:
            'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/cd4d561b26714a469d7cad790078a6ce_9366/Racer_TR21_Shoes_Pink_GY3682_01_standard.jpg'),
  ];

  var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prod) => prod.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
