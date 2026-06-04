import 'package:flutter/material.dart';
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        "image": "assets/images/ob_1.png",
        "title": "Shop Everything You Love",
        "description":
        "Explore trending products from top brands and discover the best deals every day.",
      },
      {
        "image": "assets/images/ob_2.png",
        "title": "Safe & Secure Payments",
        "description":
        "Enjoy hassle-free checkout with trusted payment methods and complete transaction security.",
      },
      {
        "image": "assets/images/ob_3.png",
        "title": "Fast Delivery, Every Time",
        "description":
        "Track your orders in real time and receive them right at your doorstep without delays.",
      },
    ];

    return Scaffold(

    );
  }
}
