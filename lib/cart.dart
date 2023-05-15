import 'package:flutter/material.dart';

import 'models/item.dart';


class Cart with ChangeNotifier{
  List<Books> _books=[];

  double _price=0;

  void add(Books books){
    _books.add(books);
    _price+=books.price;
    notifyListeners();
  }

  int get count{
    return _books.length;
  }
  double get totalprice{
    return _price;
  }

  List<Books> get basketitem{
    return _books;
}
void remove(Books books){
    _books.remove(books);
    _price-=books.price;
    notifyListeners();
}
}