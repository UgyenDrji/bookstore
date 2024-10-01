import 'package:bookstore/authentication/auth_services.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/modeldata/datas.dart';
import 'package:bookstore/pages/bottom_navBar.dart';
import 'package:bookstore/pages/forgot_password.dart';
import 'package:bookstore/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  AuthServices _auth = AuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isObs = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: Color(0xff9d0208),
          title: Text("Log In",style: TextStyle(fontSize: 24,color:  Colors.green,fontWeight: FontWeight.bold)),
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ForgetPassword()),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 20,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: MaterialButton(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  height: 40,
                  color: Colors.blue,
                  onPressed: () async {
                    User? user = await _auth.signInWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
                    if (user != null) {
                      Get.snackbar(
                          backgroundColor: Colors.white,
                          "Success",
                          "Sign In Successful");
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>HomePage()));
                    } else {
                      Get.snackbar(
                        backgroundColor: Colors.white,
                        "Sorry",
                        "Your email or Password may be wrong",
                      );
                    }
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 19, color: Colors.white, fontWeight:  FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}