import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nex_cart/utils/app_colors.dart';
import 'package:nex_cart/view/home/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Map<String, String>> categories = [
    {"title": "Books", "image": "assets/temp/book.png"},
    {"title": "Soap", "image": "assets/temp/soap.png"},
    {"title": "Pent", "image": "assets/temp/pent.jpg"},
    {"title": "Shirt", "image": "assets/temp/shirt.jpg"},
    {"title": "Mobile", "image": "assets/temp/mobile.png"},
    {"title": "Shose", "image": "assets/temp/shose.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.cardColor,
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/temp/user_image.png"),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            "user@gmail.com",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Drawer Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _drawerItem(
                      icon: Icons.dashboard_outlined,
                      title: "Categories",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.shopping_cart_outlined,
                      title: "My Cart",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.favorite_border,
                      title: "Wishlist",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.receipt_long_outlined,
                      title: "My Orders",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.local_shipping_outlined,
                      title: "Track Order",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.location_on_outlined,
                      title: "Manage Addresses",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.discount_outlined,
                      title: "Coupons & Offers",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.language_outlined,
                      title: "Language",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.notifications_none,
                      title: "Notifications",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.help_outline,
                      title: "Help Center",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.contact_support_outlined,
                      title: "Contact Us",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.privacy_tip_outlined,
                      title: "Privacy Policy",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.description_outlined,
                      title: "Terms & Conditions",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.star_border,
                      title: "Rate Us",
                      onTap: () {},
                    ),

                    _drawerItem(
                      icon: Icons.share_outlined,
                      title: "Share App",
                      onTap: () {},
                    ),

                    const Divider(),

                    _drawerItem(
                      icon: Icons.logout,
                      title: "Logout",
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      onTap: () {
                        // Logout logic
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        title: Text(
          "Welcome, \n user",
          style: GoogleFonts.outfit(color: AppColors.primaryBlue),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TODO Search Container
            SizedBox(height: 10),
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
                  prefixIcon: Icon(Icons.search, color: AppColors.primaryBlue),
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
                      margin: const EdgeInsets.only(
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
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
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.67,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => ProductDetailsScreen());
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width / 2.1,
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
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 24),
      title: Text(
        title,
        style: GoogleFonts.outfit(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
