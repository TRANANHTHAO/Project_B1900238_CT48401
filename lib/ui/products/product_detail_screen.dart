import 'package:flutter/material.dart';
import 'package:shopcoffee/ui/products/shopping_cart_icon.dart';

import '../../models/product.dart';
import '../cart/cart_manager.dart';
import '../screens.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetailScreen(
    this.product, {
    super.key,
    //  this.cartItem,
    //  this.productId,
  });

  final Product product;
  // final CartItem cartItem;
  // final String productId;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(
            fontSize: 22,
            wordSpacing: 4,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lato',
            letterSpacing: 2,
          ),
        ),
        actions: <Widget>[
          //const MainAxisAlignment.center,
          Ink(
            //padding: EdgeInsets.all(10),
            width: 70,
            height: 70,
            decoration: const ShapeDecoration(
              color: Color.fromARGB(255, 66, 38, 2),
              shape: CircleBorder(),
              shadows: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 10,
                  color: Color.fromARGB(255, 111, 115, 118),
                  //offset: Offset(20, 20),
                ),
              ],
            ),
            child: buildIconShoppingCart(),
          ),
        ],
        //leading: buildShoppingCartIcon(),
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
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
      //body: SingleChildScrollView(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        product.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.grey,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                  // ignore: sort_child_properties_last
                  child: ValueListenableBuilder<bool>(
                    valueListenable: product.isFavoriteListenable,
                    builder: (ctx, isFavorite, child) {
                      return IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Color.fromARGB(255, 189, 69, 0),
                          size: 30,
                        ),
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(10.0),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          ctx
                              .read<ProductsManager>()
                              .toggleFavoriteStatus(product);
                        },
                      );
                    },
                  ),
                  width: 200,
                  height: 260,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Text(
                        'Giá: ${product.price}00 VND',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 7, 7, 7),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 184, 67, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          final cart = context.read<CartManager>();
                          cart.addItem(product);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Sản phẩm được thêm vào giỏ hàng',
                                ),
                                duration: const Duration(seconds: 5),
                                action: SnackBarAction(
                                  label: 'Xóa',
                                  textColor: Colors.blue,
                                  onPressed: () {
                                    cart.removeSingleItem(product.id!);
                                  },
                                ),
                              ),
                            );
                        },
                        child: const SizedBox(
                          height: 30,
                          child: Text(
                            'Thêm vào giỏ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
                            horizontal: 35.0,
                          ),
                          backgroundColor: Color.fromARGB(255, 0, 63, 114),
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
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 64, 30, 0),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(2, 2),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 8.0),
            child: const Text(
              'Mô tả chi tiết sản phẩm ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: 20,
              ),
              //softWrap: true,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.justify,
                softWrap: true,
                style: const TextStyle(
                  color: Color.fromARGB(255, 7, 7, 7),
                  fontSize: 16,
                ),
                textScaleFactor: 1.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
