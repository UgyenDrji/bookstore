import 'package:bookstore/firebase_options.dart';
import 'package:bookstore/manageState.dart';
import 'package:bookstore/pages/home_page.dart';
import 'package:bookstore/pages/login.dart';
import 'package:bookstore/pages/register.dart';
import 'package:bookstore/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ManageState()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      getPages: [

        GetPage(name: '/splash', page: ()=>SplashScreen()),
        GetPage(name: '/home', page: ()=>HomePage()),
        GetPage(name: "/login", page: ()=>Login())
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
