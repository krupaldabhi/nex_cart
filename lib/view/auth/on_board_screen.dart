import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_cart/utils/app_colors.dart';

import 'login_screen.dart';
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController _pageController = PageController();

  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
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

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemCount: onboardingData.length,
          itemBuilder: (context , index){
            var item = onboardingData[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('${item['image']}')),
              Text(item['title'].toString(),style: GoogleFonts.outfit(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold, fontSize: 20,
              ),),
              SizedBox(height: 10,),
              Text("${item['description']}",style: GoogleFonts.outfit(fontSize: 14,color: Colors.black ),textAlign: TextAlign.center,)


            ],
          ),
        );
      }),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          onboardingData.length,
              (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: currentPage == index ? 25 : 8,
            decoration: BoxDecoration(
              color: currentPage == index
                  ? AppColors.primaryBlue
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Previous Button
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      if (currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      height: 58,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: AppColors.primaryBlue.withOpacity(0.3),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 18,
                            color: AppColors.primaryBlue,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Previous",
                            style: GoogleFonts.outfit(
                              color: AppColors.primaryBlue,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Next Button
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      if (currentPage < onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        print("This is Last Index And Page Route");
                        Get.off(()=> LoginScreen());
                      }
                    },
                    child: Container(
                      height: 58,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryBlue,
                            AppColors.primaryBlue.withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryBlue.withOpacity(0.35),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
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
