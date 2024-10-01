import 'package:bookstore/constant.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/modelclass/model_class.dart';
import 'package:bookstore/modeldata/datas.dart';
import 'package:bookstore/pages/payment_done.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  PaymentModel _selectedMethod = allMethods[0];

  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8CC0DE),
          centerTitle: true,
          title: Text(
            "Payment Information",
            style: myStyle(24,Colors.black,FontWeight.bold),
          ),
          // centerTitle: true,
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height *1,
                  width: MediaQuery.of(context).size.width *0.9,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        "Customer Name: ${ms.userDetails[0].userName}",
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Location: ${ms.userDetails[0].address}",
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "No of items: ${ms.userDetails.length}",
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Total Price: \$${ms.calculateTotalPrice()}",
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 20,),
                      Gap(10),
                      Text(
                        "Choose payment method",
                        style: TextStyle(fontSize: 20),
                      ),
                      Gap(20),
                      DropdownButton<PaymentModel>(
                        value: _selectedMethod,
                        onChanged: (PaymentModel? newValue) {
                          setState(() {
                            _selectedMethod = newValue!;
                          });
                        },
                        items: allMethods.map<DropdownMenuItem<PaymentModel>>(
                            (PaymentModel method) {
                          return DropdownMenuItem<PaymentModel>(
                            value: method,
                            child: Row(
                              children: [
                                Image.asset("${method.imgUrl}"),
                                Gap(10),
                                Text("${method.paymentMethod}"),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      Gap(10),
                      _selectedMethod == allMethods[0]
                          ? Gap(10)
                          : Column(
                        children: [
                          TextFormField(
                            controller: _cardNumber,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Card number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter card number';
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          TextFormField(
                            controller: _amount,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Amount',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                          ),
                          Gap(10),
                          TextFormField(
                            controller: _password,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      Gap(30),
                      MaterialButton(
                        color: Color(0xff8CC0DE),
                        minWidth: double.infinity,
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Confirmation",
                            titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            content: Text(
                              "Do you want to purchase?",
                              style: TextStyle(fontSize: 16),
                            ),
                            backgroundColor: Colors.white,
                            radius: 10,
                            barrierDismissible: false,
                            actions: [
                              OutlinedButton(
                                onPressed: () {
                                  Get.back(); // Close the dialog
                                },
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back(); // Close the dialog
                                  Get.to(PaymentDone());
                                  Get.snackbar( "message","Thank you, Purchase Successful",
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white
                                  );
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          );
                        },
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
