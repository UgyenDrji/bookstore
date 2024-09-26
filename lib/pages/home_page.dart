import 'package:bookstore/manageState.dart';
import 'package:bookstore/modeldata/datas.dart';
import 'package:bookstore/pages/book_details.dart';
import 'package:bookstore/pages/bookmarks.dart';
import 'package:bookstore/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.bottomSheet(
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.wb_sunny_outlined),
                        title: Text("Light Mode"),
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                          Get.back(); // Close the bottom sheet
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.wb_sunny),
                        title: Text("Dark Mode"),
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                          Get.back(); // Close the bottom sheet
                        },
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
              );
            },
              child: Icon(Icons.menu)),
          title: Text("Book Store",style: TextStyle(
            fontSize: 24,
            color: Colors.green,
            fontWeight: FontWeight.bold
          ),),
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>Bookmarks()));
              },
                child: Icon(Icons.bookmark_sharp,size: 30,color: Color(0xff6C946F) ,)),
            Gap(15),
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CartPage()));
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Color(0xffFFB200),
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -10,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        "${ms.counter}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(10),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Arrivals",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),),
              Gap(10),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: allBooks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white, // Card background color
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder) => BookDetails(bookModel: allBooks[index],)));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Center(
                              child: Image(
                                image: AssetImage("${allBooks[index].img}"),
                                height: 150,
                                fit: BoxFit.cover, // Add this to make the image fit the space
                              ),
                            ),
                            Text(
                              "${allBooks[index].bookName}",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                            Text(
                              "${allBooks[index].author}",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              "${allBooks[index].publishDate}",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              "\$ ${allBooks[index].price}",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addCart(allBooks[index]);
                                  if (added) {
                                    Get.snackbar("Message","Product added to Cart",
                                      backgroundColor: Colors.grey,
                                      colorText: Colors.white,
                                        duration: Duration(seconds: 1),
                                      snackPosition: SnackPosition.BOTTOM
                                    );
                                  } else {
                                    Get.snackbar("Message","Product already added to Cart",
                                        backgroundColor: Colors.grey,
                                        colorText: Colors.white,
                                        duration: Duration(seconds: 1),
                                        snackPosition: SnackPosition.BOTTOM
                                    );
                                  }
                                },
                                icon: Icon(
                                  Icons.shopping_cart_checkout,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  bool added = ms.addBookMarks(allBooks[index]);
                                  if (added) {
                                    Get.snackbar(
                                      "Message","Added to bookmarks",
                                      backgroundColor: Colors.grey,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                        duration: Duration(seconds: 1)
                                    );
                                  } else {
                                    // Get.snackbar(
                                    //     "Message","Already added to bookMarks",
                                    //     duration: Duration(seconds: 2),
                                    //     backgroundColor: Colors.grey,
                                    //     colorText: Colors.white
                                    // );
                                  }
                                },
                                icon: Icon(
                                  Icons.bookmark_sharp,
                                  size: 30,
                                  color: ms.isBookMarked(allBooks[index]) ? Colors.green : Colors.grey,
                                ),
                              ),
                            ])
                          ]),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
