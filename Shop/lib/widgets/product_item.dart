import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/cart.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // ProductItem(String id, String title, String imageUrl);

  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, _ /* child */) => IconButton(
              icon: Icon(product.isFavorite
                  ? Icons.favorite_sharp
                  : Icons.favorite_border_sharp),
              color: Color.fromRGBO(252, 0, 255, 5),
              onPressed: () {
                product.toggleFavorite();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_sharp),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
            color: Color.fromRGBO(252, 0, 255, 5),
          ),
        ),
      ),
    );
  }
}
