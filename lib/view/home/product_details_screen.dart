import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_cart/utils/app_colors.dart';

import '../e_commerce/cart_list_screen.dart';


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
  String title = '';
  String weight = '';
  String size = '';
  String photo = '';
  String desc = '';
  String price = '';
  var args = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Argumenets $args");
    if(args != null){
      setState(() {
        title =  args['title'];
        weight =  args['weight'];
        size =  args['size'];
        desc =  args['desc'];
        photo =  args['photo'];
        price =  args['price'];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
    appBar: AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.screenBackground,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
              size: 18,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.outfit(
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
    ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO Caresol SLider
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 300,
            //     viewportFraction: 0.92,
            //     enlargeCenterPage: true,
            //     autoPlay: true,
            //     autoPlayInterval: const Duration(seconds: 3),
            //   ),
            //   items: imgList.map((item) {
            //     return Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 5),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(25),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black.withOpacity(0.12),
            //             blurRadius: 15,
            //             offset: const Offset(0, 8),
            //           ),
            //         ],
            //       ),
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(25),
            //         child: Image.network(
            //           item,
            //           fit: BoxFit.cover,
            //           width: double.infinity,
            //         ),
            //       ),
            //     );
            //   }).toList(),
            // ),
            Container(
              height: 200,
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(photo,fit: BoxFit.cover,),
            ),
            // TODO Data Of Desc
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
        
                children: [
                  Text(
                   title,
                    style: GoogleFonts.outfit(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8),


                  Text(desc,style: GoogleFonts.outfit(color: AppColors.greyText,fontSize: 12),),

                  SizedBox(height: 10,),
                  Text(
                    "₹${price}",
                    style: GoogleFonts.outfit(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("About More Info",style: GoogleFonts.outfit(fontWeight: FontWeight.bold,color: AppColors.black,fontSize: 18),),
                  infoColum(title: "Waight", desc: '$weight'),
                  infoColum(title: "Size", desc: '$size'),

                  SizedBox(height: 10,),
                  // TODO Related Data
                  Text("Related Products ",style: GoogleFonts.outfit(fontWeight: FontWeight.bold,color: AppColors.black,fontSize: 18),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 270,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context , index){

                      return      InkWell(
                        onTap: (){
                          // Get.to(()=> ProductDetailsScreen());
                        },
                        child: Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(18),
                                    ),
                                    child: Image.asset(
                                      "assets/temp/shose.jpg",
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  // Discount Badge
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "20% OFF",
                                        style: GoogleFonts.outfit(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Wishlist
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Branded Shoes Puma",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      "Casual Running Shoes",
                                      style: GoogleFonts.outfit(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      "₹500",
                                      style: GoogleFonts.outfit(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 100,),

        
        
                ],
              ),
            ),
        
        
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.primaryBlue,
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Get.to(()=> CartListScreen());
                    },
                    child: Text(
                      "Buy Now • ₹$price",
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget infoColum({required title , required desc }){
    return Column(
      children: [
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Text(title,style: GoogleFonts.outfit(color: Colors.black , fontWeight: FontWeight.bold),),
            Text(desc,style: GoogleFonts.outfit(color: Colors.grey),)
          ],
        ),
        Divider()
      ],
    );
}
}
