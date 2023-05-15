import 'package:buy_books/app_data.dart';
import 'package:buy_books/cart.dart';
import 'package:buy_books/models/item.dart';
import 'package:buy_books/screens/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../widget/book_item.dart';

class FirstPage extends StatelessWidget {
  List<Books> Book = [
    Books(
        bookName: 'Killing',
        imageUrl: 'images/book1.png',
        autherName: 'Meeks',
        price: 250),
    Books(
        bookName: 'Annual',
        imageUrl: 'images/book2.png',
        autherName: 'report',
        price: 150),
    Books(
        bookName: 'memory book school',
        imageUrl: 'images/book3.png',
        autherName: 'eliana',
        price: 250),
    Books(
        bookName: 'spiritual',
        imageUrl: 'images/book4.png',
        autherName: 'asfrhjf',
        price: 250),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Bookstore'),
            backgroundColor: Colors.orange[500],
            actions: [
              Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return ShoppingCart();
                    }));
                  }, icon: Icon(Icons.shopping_cart)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15),
                      child: Text('${cart.totalprice}')),
                ],
              ),
            ],
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Bookmarks',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // padding: EdgeInsets.only(right: 90),
                  child: Text(
                    '${cart.count}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: Book.length,
                  itemBuilder: (context, i) => Card(
                    child: ListTile(
                      title: Text('${Book[i].bookName}'),
                      subtitle: Row(
                        children: [
                          Text('${Book[i].autherName}'),
                          SizedBox(
                            width: 25,
                          ),
                          Text('${Book[i].price} \$'),
                        ],
                      ),
                      trailing: Image.asset('${Book[i].imageUrl}'),
                      leading: IconButton(
                        onPressed: () {
                          cart.add(Book[i]);
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
