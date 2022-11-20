import 'package:flutter/material.dart';
import 'package:shopcoffee/ui/cart/cart_manager.dart';
import 'package:shopcoffee/ui/cart/cart_screen.dart';
import 'package:shopcoffee/ui/products/top_right_badge.dart';
import 'package:provider/provider.dart';

Widget buildIconShoppingCart() {
  return Consumer<CartManager>(
    builder: (ctx, cartManager, child) {
      return TopRightBadge(
        data: cartManager.productCount,
        child: IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(ctx).pushNamed(CartScreen.routeName);
          },
        ),
      );
    },
  );
}

Widget builIcondShoppingCartActive() {
  return Consumer<CartManager>(
    builder: (ctx, cartManager, child) {
      return TopRightBadge(
        data: cartManager.productCount,
        child: IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 28,
          ),
          onPressed: () {
            Navigator.of(ctx).pushNamed(CartScreen.routeName);
          },
        ),
      );
    },
  );
}
