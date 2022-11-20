import 'package:flutter/material.dart';
import 'package:shopcoffee/ui/products/shopping_cart_icon.dart';

import '../products/favorite_screen.dart';

import '/ui/screens.dart';
import 'package:provider/provider.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int selectedIndex = 0;
  final Widget _home = const ProductsOverviewScreen();

  final Widget _cart = const CartScreen();
  final Widget _favorite = const FavoriteScreen();
  final Widget _user = const UserProductsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color.fromARGB(255, 149, 48, 1),
        unselectedItemColor: const Color.fromARGB(255, 67, 27, 1),
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.shop_2_outlined),
              activeIcon: Icon(Icons.shop),
              label: 'Trang Chủ'),
          BottomNavigationBarItem(
              icon: buildIconShoppingCart(),
              activeIcon: builIcondShoppingCartActive(),
              label: 'Giỏ Hàng'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'Đã Thích'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Tài Khoản'),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }

  getBody() {
    if (selectedIndex == 0) {
      return _home;
    } else if (selectedIndex == 1) {
      return _cart;
    } else if (selectedIndex == 2) {
      return _favorite;
    } else {
      return _user;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
