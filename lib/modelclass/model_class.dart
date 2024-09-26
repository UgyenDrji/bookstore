class BookModel{
  String bookName;
  String author;
  String publishDate;
  double price;
  int quantity;
  String img;
  String summary;
  String rating;

  BookModel({
    required this.bookName,
    required this.author,
    required this.publishDate,
    required this.price,
    required this.quantity,
    required this.img,
    required this.summary,
    required this.rating,
});
}

class Users{
  String userName;
  String email;
  int phoneNo;
  String address;
  double totalPrice;

  Users({
    required this.userName,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.totalPrice,
});
}

class PaymentModel {
  String imgUrl;
  String paymentMethod;

  PaymentModel({
    required this.paymentMethod,
    required this.imgUrl,
  });
}

class Register{
  String name;
  String email;
  String password;
  String phoneNo;

  Register({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNo,
  });
}

