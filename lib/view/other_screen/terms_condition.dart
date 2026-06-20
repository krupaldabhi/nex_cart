import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class TermsCondition extends StatelessWidget {
  List<Map<String, String>> termsAndConditions = [
    {
      "title": "Acceptance of Terms",
      "content":
      "By accessing or using NexCart, you agree to be bound by these Terms & Conditions. If you do not agree, please do not use our services.",
    },
    {
      "title": "User Account",
      "content":
      "You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.",
    },
    {
      "title": "Product Information",
      "content":
      "We strive to ensure that all product descriptions, images, prices, and availability information are accurate. However, errors may occasionally occur.",
    },
    {
      "title": "Orders and Payments",
      "content":
      "All orders are subject to acceptance and availability. Payments must be completed through approved payment methods before an order is processed.",
    },
    {
      "title": "Shipping and Delivery",
      "content":
      "Delivery times are estimates and may vary depending on location, weather conditions, or other unforeseen circumstances.",
    },
    {
      "title": "Returns and Refunds",
      "content":
      "Returns and refunds are subject to our Return Policy. Products must meet eligibility requirements before a refund or replacement is approved.",
    },
    {
      "title": "Prohibited Activities",
      "content":
      "Users must not misuse the platform, engage in fraudulent activities, attempt unauthorized access, or violate applicable laws while using NexCart.",
    },
    {
      "title": "Intellectual Property",
      "content":
      "All content, trademarks, logos, designs, and materials available on NexCart are the property of NexCart or its licensors and are protected by applicable laws.",
    },
    {
      "title": "Limitation of Liability",
      "content":
      "NexCart shall not be liable for any indirect, incidental, special, or consequential damages arising from the use of our platform or services.",
    },
    {
      "title": "Account Suspension",
      "content":
      "We reserve the right to suspend or terminate accounts that violate these Terms & Conditions or engage in suspicious activities.",
    },
    {
      "title": "Changes to Terms",
      "content":
      "NexCart may update these Terms & Conditions at any time. Continued use of the app after changes are posted constitutes acceptance of the revised terms.",
    },
    {
      "title": "Governing Law",
      "content":
      "These Terms & Conditions shall be governed by and interpreted in accordance with the laws applicable in your jurisdiction.",
    },
    {
      "title": "Contact Us",
      "content":
      "For any questions regarding these Terms & Conditions, please contact the NexCart support team.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        title: Text(
          "Terms & Condition",
          style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: termsAndConditions.length,
        itemBuilder: (context, index) {
          final item = termsAndConditions[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 6),
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    item["title"]!,
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    item["content"]!,
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}