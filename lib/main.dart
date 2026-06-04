import 'package:flutter/material.dart';
import 'package:nex_cart/view/auth/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nex Cart',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
