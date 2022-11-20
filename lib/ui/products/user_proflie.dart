//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopcoffee/models/product.dart';
import 'package:shopcoffee/models/user.dart';
import 'package:shopcoffee/ui/products/products_manager.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Future<void> _saveForm() async {
  //   final isValid = _editForm.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   _editForm.currentState!.save();

  //   setState(() {
  //     _isLoading = true;
  //   });
  var _name;
  var _phone;
  var _email;
  var _address;
  final _userName = TextEditingController();
  final _userAddress = TextEditingController();
  final _userPhone = TextEditingController();
  final _userEmail = TextEditingController();
  // String userName = '';
  // String userAddress = '';
  // String userPhone = '';
  // String userEmail = '';
  @override
  Widget build(BuildContext context) {
    //final User user;

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
          'Thong tin tai khoan',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Ink(
            //padding: EdgeInsets.all(10),
            width: 50,
            height: 50,
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
            child: IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _name = _userName.text;
                //_address = _userAddress.text;
                _email = _email.text;
              },
            ),
          ),
        ],
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
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 253, 242, 225)),
        child: Form(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     image: DecorationImage(
              //       image: NetworkImage(
              //         user.imageUrl,
              //       ),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _userName,
                decoration: const InputDecoration(labelText: 'Tên người dùng'),
                textInputAction: TextInputAction.next,
                autofocus: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _userPhone,
                decoration: const InputDecoration(labelText: 'Số Điện Thoại'),
                textInputAction: TextInputAction.next,
                autofocus: true,
                //keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _userEmail,
                decoration: const InputDecoration(labelText: 'E-mail'),
                textInputAction: TextInputAction.next,
                autofocus: true,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Email không hợp lệ!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _userAddress,
                decoration: const InputDecoration(labelText: "Địa chỉ"),
                maxLines: 2,
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
