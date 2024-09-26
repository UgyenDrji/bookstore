
import 'package:bookstore/constant.dart';
import 'package:bookstore/pages/bookmarks.dart';
import 'package:bookstore/pages/cart_page.dart';
import 'package:bookstore/pages/home_page.dart';
import 'package:bookstore/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  List list = [
    HomePage(),
    Bookmarks(),
    CartPage(),
    ProfilePage(),
  ];
  List<Icon> allItems = [
    Icon(Icons.home,color: secondaryColor,size: 30,),
    Icon(Icons.bookmark_added,color: secondaryColor,size: 30,),
    Icon(Icons.shopping_cart_outlined,color: secondaryColor,size: 30),
    Icon(Icons.perm_identity_outlined,color: secondaryColor,size: 30),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color(0xffCECFBB),
          index: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: allItems,
          color: primaryColor// Add this line
      ),
    );
  }
}