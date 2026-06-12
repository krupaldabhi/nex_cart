import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_cart/utils/app_colors.dart';


class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor: AppColors.primaryBlue,
        title: Text("Product Details",style: GoogleFonts.outfit(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO Caresol SLider

          Container(
              child: CarouselSlider(
                options: CarouselOptions(),
                items: imgList
                    .map((item) => Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Center(
                      child:
                      Image.network(item, fit: BoxFit.cover, width: 1000)),
                ))
                    .toList(),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Branded Shoes Puma",style: GoogleFonts.outfit(fontWeight: FontWeight.bold,color: AppColors.primaryBlue,fontSize: 18),),
                Text("Puma shoes are engineered for a blend of performance and urban streetwear. Known for the iconic Cat logo and Formstrip, they feature proprietary technologies like responsive NITRO foam, ultra-comfortable SOFTRIDE cushioning, and durable PUMALite foam for superior lightweight support and energy return",style: GoogleFonts.outfit(color: AppColors.greyText,fontSize: 12),),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Only At /-",style: GoogleFonts.outfit(color: Colors.grey),),
                    Text("₹ 5,999",style: GoogleFonts.outfit(fontWeight: FontWeight.bold,color: AppColors.primaryBlue,fontSize: 18),),
                  ],
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }
}
