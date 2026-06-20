import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class PrivacyPolicy extends StatelessWidget {
  List<Map<String, String>> privacyPolicy = [
    {
      "title": "Information We Collect",
      "content":
      "NexCart collects information such as your name, email address, phone number, shipping address, payment details, and order history to provide and improve our services.",
    },
    {
      "title": "How We Use Your Information",
      "content":
      "We use your information to process orders, provide customer support, improve user experience, send order updates, and offer personalized recommendations.",
    },
    {
      "title": "Payment Security",
      "content":
      "All payment transactions are processed through secure payment gateways. NexCart does not store your complete payment card information on our servers.",
    },
    {
      "title": "Sharing of Information",
      "content":
      "We do not sell your personal information. Information may be shared with trusted partners such as delivery providers and payment processors solely to fulfill services.",
    },
    {
      "title": "Cookies and Tracking",
      "content":
      "NexCart may use cookies and similar technologies to remember preferences, analyze app usage, and improve performance.",
    },
    {
      "title": "Data Protection",
      "content":
      "We implement industry-standard security measures to protect your personal information from unauthorized access, alteration, or disclosure.",
    },
    {
      "title": "Your Rights",
      "content":
      "You may access, update, or delete your personal information by contacting our support team or through account settings where available.",
    },
    {
      "title": "Third-Party Services",
      "content":
      "Our app may contain links to third-party websites or services. We are not responsible for the privacy practices of those external platforms.",
    },
    {
      "title": "Children's Privacy",
      "content":
      "NexCart is not intended for children under 13 years of age. We do not knowingly collect personal information from children.",
    },
    {
      "title": "Policy Updates",
      "content":
      "We may update this Privacy Policy from time to time. Any changes will be posted within the app with an updated revision date.",
    },
    {
      "title": "Contact Us",
      "content":
      "If you have any questions regarding this Privacy Policy, please contact the NexCart support team.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
          style: GoogleFonts.outfit(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: privacyPolicy.length,
        itemBuilder: (context, index) {
          var item = privacyPolicy[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
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