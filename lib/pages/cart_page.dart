
import 'package:bookstore/constant.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/pages/user_info.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart",style: myStyle(24,Colors.green,FontWeight.bold),),
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.cartBooks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height:
                              MediaQuery.of(context).size.height * 0.3,
                              width:
                              MediaQuery.of(context).size.width * 1,
                              padding: EdgeInsets.all(10),
                              color: Colors.orangeAccent.withOpacity(0.3),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(image: AssetImage("${ms.cartBooks[index].img}"),width: 100,),
                                  Column(
                                    children: [
                                      Text(
                                        "${ms.cartBooks[index].bookName}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "\$${ms.cartBooks[index].price}",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Gap(30),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              ms.decreaseQuantity(
                                                  ms.cartBooks[index]);
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Gap(10),
                                          Text(
                                            "${ms.cartBooks[index].quantity}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Gap(10),
                                          IconButton(
                                            onPressed: () {
                                              ms.increaseQuantity(
                                                  ms.cartBooks[index]);
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: Colors.green,
                                            ),
                                          ),
                                          Gap(10),
                                          IconButton(
                                            onPressed: () {
                                              ms.delete(
                                                  ms.cartBooks[index]);
                                            },
                                            icon: Icon(
                                              Icons.delete_forever,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Center(
                    child: Column(
                      children: [
                        Gap(10),
                        Text(
                          "Total Price: \S${ms.calculateTotalPrice()}",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(UserInfo());
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width *0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red
                            ),
                            child: Center(
                              child: Text("CheckOut",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
