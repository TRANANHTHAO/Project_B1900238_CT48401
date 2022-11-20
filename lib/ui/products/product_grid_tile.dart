import 'package:flutter/material.dart';

import '../../models/product.dart';

import 'product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../cart/cart_manager.dart';
import '../products/products_manager.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: buildGridFooter(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  product.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: product.isFavoriteListenable,
                  builder: (ctx, isFavorite, child) {
                    return Ink(
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: const Color.fromARGB(255, 205, 76, 2),
                          size: 25,
                        ),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          ctx
                              .read<ProductsManager>()
                              .toggleFavoriteStatus(product);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridFooter(BuildContext context) {
    return GridTileBar(
      backgroundColor: Color.fromARGB(255, 62, 21, 0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 7,
          ),
          Text(
            product.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${product.price}00 VND',
            style: const TextStyle(
              color: Color.fromARGB(255, 243, 194, 115),
              fontSize: 14,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        alignment: Alignment.centerRight,
        icon: const Icon(
          Icons.add_shopping_cart,
          size: 23,
          color: Color.fromARGB(255, 222, 56, 5),
        ),
        onPressed: () {
          final cart = context.read<CartManager>();
          cart.addItem(product);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Text(
                  'Đã thêm sản phẩm vào giỏ',
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
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
