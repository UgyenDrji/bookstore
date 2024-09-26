import 'package:bookstore/modelclass/model_class.dart';
import 'package:flutter/material.dart';

class ManageState with ChangeNotifier{
  int _counter=0;

  set counter(int value){
    _counter= value;
    notifyListeners();
  }
  int get counter=>_counter;

  void increaseCounter(){
    _counter++;
    notifyListeners();
  }

  List<BookModel> _bookMarks=[];
  bool addBookMarks(BookModel books) {
    if(!_bookMarks.contains(books)){
      _bookMarks.add(books);
      notifyListeners();
      return true;
    }
    else{_bookMarks.remove(books);
    notifyListeners();
    return false;
    }
  }
  bool isBookMarked(BookModel book) {
    return _bookMarks.contains(book);
  }
  List<BookModel> get bookMarks => _bookMarks;

  void removeBook(BookModel books){
    _bookMarks.remove(books);
    notifyListeners();
  }


  List<BookModel> _cartBooks = [];

  bool addCart(BookModel product) {
    if (!_cartBooks.contains(product)) {
      _cartBooks.add(product);
      _counter++;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  List<BookModel> get cartBooks => _cartBooks;

  void increaseQuantity(BookModel product) {
    product.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(BookModel product) {
    if (product.quantity > 0) {
      product.quantity--;
      notifyListeners();
    } else {
      return;
    }
  }

  void delete(BookModel product){
    _cartBooks.remove(product);
    _counter--;
    notifyListeners();
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var product in _cartBooks) {
      total = total + product.price * product.quantity;
    }
    return total;
  }

  List<Users> _userDetails = [];

  List<Users> get userDetails => _userDetails;

  void addUserDetails(String name,String email, int phone, String address, double price) {
    _userDetails.add(
      Users(
        userName: name,
        email: email,
        phoneNo: phone,
        address: address,
        totalPrice: price,
      ),
    );
  }
}

