import 'dart:io';

import 'package:bookstore/constant.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/modeldata/datas.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        appBar: AppBar(
          title:  Text('Profile Page',style: myStyle(24,Colors.green,FontWeight.bold),),
        ),
        body: Center( // Wrap with Center widget
          child: Container(
            height: 400,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blueGrey.withOpacity(0.2),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : null,
                    child: _image != null
                        ? null
                        : Icon(Icons.person, size: 40),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _captureImage,
                      child: Text('Capture Image'),
                    ),
                    ElevatedButton(
                      onPressed: _selectImage,
                      child: Text('Select Image'),
                    ),
                  ],
                ),
                Gap(20),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User Name: ${userInfo[0].name}",style: myStyle(18),),
                    Gap(5),
                    Text("User Email: ${userInfo[0].email}",style: myStyle(18)),
                    Gap(5),
                    Text("User Phone No: ${userInfo[0].phoneNo}",style: myStyle(18)),
                    Gap(20),
              ],
            )
          ]
      ),
        ),
        )
      );
    });
  }
}
