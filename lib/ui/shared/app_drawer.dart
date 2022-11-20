import 'package:flutter/material.dart';
import 'package:shopcoffee/models/user.dart';
import 'package:shopcoffee/ui/products/user_proflie.dart';

import '../orders/orders_screen.dart';
import '../products/user_products_screen.dart';

import 'package:provider/provider.dart';
import '../auth/auth_manager.dart';
import 'package:shopcoffee/ui/products/user_proflie.dart';

class AppDrawer extends StatelessWidget {
  //final User user;
  const AppDrawer({
    super.key, //required this.user,
  });

  //String userName = '';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: const Color.fromARGB(255, 1, 18, 32),
      child: Container(
        color: const Color.fromARGB(255, 1, 16, 28),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://toigingiuvedep.vn/wp-content/uploads/2022/03/hinh-nen-mau-nau-dam-dep.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png'),
                  //backgroundColor: Color.fromARGB(255, 246, 219, 197),
                ),
                accountName: Text('Tran Ngoc Thao'),
                accountEmail: Text('thaob1900238@gmail.com'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text(
                  'Thông tin tài khoản',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => EditProfilePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.shop,
                  color: Colors.white,
                ),
                title: const Text(
                  'Trang Chủ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                title: const Text(
                  'Lịch Sử Đơn Hàng',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(OrdersScreen.routeName);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                title: const Text('Quản Lý Sản Phẩm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(UserProductsScreen.routeName);
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              const Text(
                'Thiết Lập',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  //letterSpacing: 3,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                  color: Color.fromARGB(255, 255, 22, 5),
                ),
                title: const Text(
                  'Đăng Xuất',
                  style: TextStyle(
                    color: Color.fromARGB(255, 235, 17, 1),
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                    ..pop()
                    ..pushReplacementNamed('/');
                  context.read<AuthManager>().logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
