import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_cart/utils/app_colors.dart';
import 'package:nex_cart/view/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State Called");
    checkLoginStatus();

  }
  Future<void> checkLoginStatus() async {
    print("Methord Called");
    SharedPreferences sp = await SharedPreferences.getInstance();
    var id =   await  sp.getString("userId") ;
   if(id != null && id.isNotEmpty ){
     print("Id Is Geted $id ");
     Timer(Duration (seconds: 4), (){
       print("Print After 4 Seconds");
       Get.offAll(()=> HomeScreen());
     });
   } else{
     print("Id Not Geted");
     Timer(Duration (seconds: 4), (){
       print("Print After 4 Seconds");
       Get.offAll(()=> OnBoardScreen());
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/icons/app_icon.png")),

            // Desc
            Text(
              "Shop Smarter, Live Better",
              style: GoogleFonts.outfit(
                fontSize: 25,
                color: AppColors.primaryBlue
              ),
            ),





          ],
        ),
      ),
    );
  }
}
