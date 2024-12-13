import 'package:flutter/material.dart';
import 'package:sixthproject/models/product.dart';

class Shop extends ChangeNotifier {

  // products for sale
  final List <Product>_shop = [

    // product 1
    Product(
      name: 'HandBag',
      price: 100,
      description: 'Elevate your style with this chic and versatile handbag. Designed with premium materials.',
      imagePath: 'lib/images/bibi.jpeg'
    ), // product 2
    Product(
      name: 'Shoe',
      price: 99.00,
      description: 'Step into comfort and style with these shoes, designed for everyday wear.',
      imagePath: 'lib/images/wiwi.jpeg',
    ), // product 3
    Product(
      name: 'Wrist-Watch',
      price: 160.50,
      description: 'Timeless elegance meets modern craftsmanship in this watch. ',
      imagePath: 'lib/images/lili.jpeg',
    ), // product 4
    Product(
      name: 'Luggage Bag',
      price: 110,
      description: 'Durable and stylish, this luggage bag is your ultimate travel companion.',
      imagePath: 'lib/images/ugo.jpeg',
    ), // product 5
    Product(
      name: 'Hoodie',
      price: 88.50,
      description: 'Stay cozy and stylish with this premium hoodie. Made from ultra-soft, breathable fabric.',
      imagePath: 'lib/images/pipi.jpeg'
    ),
  ];

  //user cart
List<Product> _cart = [];

  // get product list

List<Product>  get shop => _shop;

  //get user cart
List<Product> get cart => _cart;

  // add item to cart

void addToCart(Product item) {
  _cart.add(item);
  notifyListeners();
}

  //remove item from cart
   void removeFromCart(Product item){
  _cart.remove(item);
  notifyListeners();
   }












}