import 'package:bookstore/constant.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/modelclass/model_class.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class BookDetails extends StatelessWidget {
  BookModel bookModel;
  BookDetails({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8CC0DE),
          centerTitle: true,
          title: Text("${bookModel.bookName}",style: myStyle(24,Colors.black,FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image(image: AssetImage("${bookModel.img}"),width: 150, height: 250,)),
                Gap(15),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Title: ',
                            style: myStyle(20,Colors.black,FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${bookModel.bookName}',
                            style: myStyle(20,Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Author: ',
                            style: myStyle(20,Colors.black,FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${bookModel.author}',
                            style: myStyle(18,Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Publish Date: ',
                            style: myStyle(20,Colors.black,FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${bookModel.publishDate}',
                            style: myStyle(16,Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Price: ',
                            style: myStyle(20,Colors.black,FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${bookModel.price}',
                            style: myStyle(16,Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Rating: ',
                            style: myStyle(20,Colors.black,FontWeight.bold),
                          ),
                          TextSpan(
                            text: '${bookModel.rating}',
                            style: myStyle(16,Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text("Summary:",style: myStyle(20,Colors.black,FontWeight.bold),),
                Gap(10),
                Text("${bookModel.summary}",style: myStyle(16),)
              ],
            ),
          ),
        ),
      );
    });
  }
}
