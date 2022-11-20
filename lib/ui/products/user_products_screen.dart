import 'package:flutter/material.dart';
import 'package:shopcoffee/ui/products/products_manager.dart';

import 'user_product_list_tile.dart';

import '../shared/app_drawer.dart';

import 'package:provider/provider.dart';
import 'edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  const UserProductsScreen({super.key});

  Future<void> _refreshProducts(BuildContext context) async {
    await context.read<ProductsManager>().fetchProducts(true);
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Quản Lý Sản Phẩm'),
        actions: <Widget>[
          buildAddButton(context),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://u7.uidownload.com/vector/769/929/vector-cafe-cup-with-vector-background-02-ai.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              colorFilter: ColorFilter.mode(
                Colors.black26,
                BlendMode.darken,
              ),
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refreshProducts(context),
            child: buildUserProductListView(),
          );
        },
      ),
    );
  }

  Widget buildUserProductListView() {
    return Consumer<ProductsManager>(
      builder: (ctx, productsManager, child) {
        return Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: productsManager.itemCount,
              itemBuilder: (ctx, i) => Column(
                children: <Widget>[
                  UserProductListTile(
                    productsManager.items[i],
                  ),
                  const Divider(
                    height: 35,
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Color.fromARGB(255, 69, 40, 1),
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
      child: IconButton(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditProductScreen.routeName,
          );
        },
      ),
    );
  }
}
