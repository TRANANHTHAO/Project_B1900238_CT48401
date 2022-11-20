import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order_item.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItem order;

  const OrderItemCard(this.order, {super.key});

  @override
  State<OrderItemCard> createState() => _OrderItemCartState();
}

class _OrderItemCartState extends State<OrderItemCard> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 253, 225, 198),
      margin: const EdgeInsets.all(18),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildOrderSummary(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
          ),
          const Divider(
            thickness: 2,
            color: Color.fromARGB(255, 2, 31, 52),
          ),
          if (_expanded) buildOrderDetails()
        ],
      ),
    );
  }

  Widget buildOrderDetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: min(widget.order.productCount * 30.0 + 5, 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color.fromARGB(255, 43, 15, 1),
      ),
      child: ListView(
        children: widget.order.products
            .map(
              (prod) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    prod.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${prod.quantity}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${prod.price}00 VND',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildOrderSummary() {
    return ListTile(
      title: Text(
        'Tổng đơn: ${widget.order.amount}00 VND',
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 3, 34, 81),
        ),
      ),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(255, 56, 61, 70),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
      ),
    );
  }
}
