import 'package:buy_books/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShoppingCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[500],

        title: Text('Shopping Cart'),
      ),
      body: Consumer<Cart>(builder: (context, cart, child) {
        return ListView.builder(
          itemCount: cart.basketitem.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                title: Text('${cart.basketitem[i].bookName}'),

                trailing:
                IconButton(icon: Icon(Icons.remove),
                  onPressed: () {
                    cart.remove(cart.basketitem[i]);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}



