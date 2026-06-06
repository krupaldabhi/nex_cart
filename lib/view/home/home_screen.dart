import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_cart/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 1;
  List<Map<String, String>> categories = [
    {
      "title": "Books",
      "image": "assets/temp/book.png",
    },
    {
      "title": "Soap",
      "image": "assets/temp/soap.png",
    },
    {
      "title": "Pent",
      "image": "assets/temp/pent.jpg",
    },
    {
      "title": "Shirt",
      "image": "assets/temp/shirt.jpg",
    },
    {
      "title": "Mobile",
      "image": "assets/temp/mobile.png",
    },{
      "title": "Shose",
      "image": "assets/temp/shose.jpg",
    },
  ];

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

          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                var item = categories[index];

                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryBlue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryBlue
                            : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 55,
                          width: 40,
                          child: Image.asset(
                            item["image"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item['title']!,
                          style: GoogleFonts.outfit(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}
