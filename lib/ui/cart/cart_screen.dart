import 'package:flutter/material.dart';

import 'cart_manager.dart';
import 'cart_item_card.dart';
import 'package:provider/provider.dart';
import '../orders/orders_manager.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 18, 32),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        title: const Text(
          'Giỏ Hàng',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Lato', fontWeight: FontWeight.bold, wordSpacing: 2),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://u7.uidownload.com/vector/769/929/vector-cafe-cup-with-vector-background-02-ai.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black26,
                BlendMode.darken,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          buildCartSummary(cart, context),
          const SizedBox(height: 15),
          Expanded(
            child: buildCartDetails(cart),
          )
        ],
      ),
    );
  }

  Widget buildCartDetails(CartManager cart) {
    return ListView(
      children: cart.productEntries
          .map(
            (entry) => CartItemCard(
              productId: entry.key,
              cartItem: entry.value,
            ),
          )
          .toList(),
    );
  }

  Widget buildCartSummary(CartManager cart, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      color: const Color.fromARGB(255, 238, 223, 210),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Tổng Cộng',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const Spacer(
                //flex: 50,
                ),
            Chip(
              label: Text(
                '${cart.totalAmount.toStringAsFixed(2)}0 VND',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.headline6?.color,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            const Padding(
              padding: EdgeInsets.all(2),
            ),
            TextButton(
              onPressed: cart.totalAmount <= 0
                  ? null
                  : () {
                      context.read<OrdersManager>().addOrder(
                            cart.products,
                            cart.totalAmount,
                          );
                      cart.clear();
                    },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 13.0,
                  //vertical: 1,
                ),
                backgroundColor: Theme.of(context).errorColor,
              ),
              child: const Text(
                'ĐẶT HÀNG',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
