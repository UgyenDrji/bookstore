import 'package:bookstore/authentication/auth_services.dart';
import 'package:bookstore/constant.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  AuthServices _auth = AuthServices();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isRePasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        appBar: AppBar(
          title: Text("Create an Account",style: myStyle(27,Colors.red,FontWeight.bold)),
          centerTitle: true,
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _firstNameController,
                        label: "Name",
                        hint: "Your name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Please enter your number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _emailController,
                        label: "Email",
                        hint: "Enter your email",
                        suffixIcon: Icons.email_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          if (!value.contains("@")) {
                            return "Enter a valid email address";
                          }
                          if (!value.contains("gmail.com")) {
                            return "Email should contain 'gmail.com'";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: _passwordController,
                        label: "Password",
                        hint: "Enter your password",
                        obscureText: _isPasswordObscured,
                        suffixIcon: _isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSuffixIconPressed: () {
                          setState(() {
                            _isPasswordObscured = !_isPasswordObscured;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: _rePasswordController,
                        label: "Re-enter Password",
                        hint: "Re-enter your password",
                        obscureText: _isRePasswordObscured,
                        suffixIcon: _isRePasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSuffixIconPressed: () {
                          setState(() {
                            _isRePasswordObscured = !_isRePasswordObscured;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please re-enter your password";
                          }
                          if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      // MaterialButton(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   minWidth: MediaQuery.of(context).size.width * 0.9,
                      //   color: Colors.blue,
                      //   onPressed: () {
                      //     if (_formKey.currentState?.validate() ?? false) {
                      //       userInfo.add(
                      //         Register(
                      //           email: _emailController.text.toString(),
                      //           password: _passwordController.text.toString(),
                      //           name: _firstNameController.text.toString(),
                      //           phoneNo: _phoneController.text.toString(),
                      //         ),
                      //       );
                      //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()), (route) => false,
                      //       );
                      //     }
                      //   },
                      //   child: Text(
                      //     "Register Now",
                      //     style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                      //   ),
                      // ),

                      MaterialButton(
                        minWidth: 400,
                        color: Colors.redAccent,
                        onPressed: () async {
                          User? user = await _auth.signUpWithEmailAndPassword(
                              _emailController.text, _passwordController.text);
                          if (user != null) {
                            Get.snackbar("Success", "Registration Successful");
                            Get.offAllNamed('/login');
                          } else {
                            Get.snackbar(
                              "Sorry",
                              "There has been a problem, try again",
                            );
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      MaterialButton(
                        minWidth: 100,
                        color: Colors.redAccent,
                        onPressed: () async {
                          _auth.signInWithGoogle();
                        },
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.g_mobiledata_sharp,color: Colors.white,),
                            Text(
                              "Login with Google",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    IconData? suffixIcon,
    void Function()? onSuffixIconPressed,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed,
        )
            : null,
      ),
      validator: validator,
    );
  }
}