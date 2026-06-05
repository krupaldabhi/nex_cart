import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_cart/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        title: Text(
          "Welcome, \n user",
          style: GoogleFonts.outfit(color: AppColors.primaryBlue),
        ),
      ),
      body: Column(
        children: [
          // TODO Search Container
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 03,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: TextEditingController(),

              decoration: InputDecoration(
                hintText: "Search Product",
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primaryBlue,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // TODO Filter
          Container(
            child: Row(
              children: [
                Image.asset(
                  "assets/temp/mobile.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 5),
                Text(
                  "Mobile",
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
