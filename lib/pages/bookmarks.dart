import 'package:bookstore/constant.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/modeldata/datas.dart';
import 'package:bookstore/pages/book_details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8CC0DE),
          title: Text("BookMarks",style: myStyle(24,Colors.black,FontWeight.bold),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ms.bookMarks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(top: 10,),
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Color(0xff8CC0DE)
                          color: index % 2 == 0 ? Color(0xff8CC0DE) : Color(0xffB0D9B1),
                          border: Border.all(color: Color(0xffB2C8BA),width: 3),
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 30,
                                      backgroundColor: primaryColor,
                                      backgroundImage: AssetImage("${ms.bookMarks[index].img}"),
                                    ),
                                    SizedBox(width: 20,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${ms.bookMarks[index].bookName}",style: myStyle(20,Colors.black,FontWeight.bold),),
                                        Text("${ms.bookMarks[index].author}",style: myStyle(16),),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: (){
                                      ms.removeBook(
                                        ms.bookMarks[index]
                                      );
                                    }, 
                                    icon: Icon(Icons.remove_circle,size: 30,color: Colors.redAccent,),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 60,),
                                Expanded(
                                  child: Text(
                                    "${ms.bookMarks[index].summary}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: myStyle(15),
                                  ),
                                ),
                              ],
                            ),
                            Gap(10),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Gap(60),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Gap(20,),
                                        Text("${ms.bookMarks[index].rating}",style: myStyle(17,Colors.black,FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> BookDetails(bookModel: allBooks[index],)));
                                  },
                                  child: Text("Read More...", style: myStyle(17,Color(0xff862B0D))),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
