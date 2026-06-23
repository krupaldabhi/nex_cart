import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nex_cart/view/auth/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_urls.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Nex Cart",
                          style: GoogleFonts.outfit(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                          ),
                        ),

                        SizedBox(height: 15),

                        _modernField(
                          emailController,
                          "Email Addresss",
                          Icons.mail,
                          isObscured: false,
                          toggleVisibility: () {},
                        ),

                        SizedBox(height: 15),

                        _modernField(
                          passwordController,
                          "Password",
                          Icons.lock,
                          isPassword: true,
                          isObscured: isPasswordObscured,
                          toggleVisibility: () {
                            setState(() {
                              isPasswordObscured = !isPasswordObscured;
                            });
                          },
                        ),

                        SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Forgot Password?"),
                          ),
                        ),

                        SizedBox(height: 10),

                        InkWell(
                          onTap: _loginUser,

                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have a account?"),

                            TextButton(
                              onPressed: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: Text(
                                "Register here!",
                                style: GoogleFonts.outfit(
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _modernField(TextEditingController controller, String hint, IconData icon, {bool isPassword = false, bool isNumber = false, required bool isObscured, required VoidCallback toggleVisibility,}) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? isObscured : false,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon, color: AppColors.lightBlue),

        suffixIcon: isPassword
            ? IconButton(
                onPressed: toggleVisibility,
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.lightBlue,
                ),
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColors.lightBlue.withOpacity(0.3)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryBlue, width: 2),
        ),

        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }

  Future<void> _loginUser() async {
    final email = emailController.text.trim();

    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      loginApi(emailAddress: email, Password: password);
    }
  }

  Future loginApi({
    required String emailAddress,
    required String Password,
  }) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();

      var response = await http.get(
        Uri.parse(
          "${AppUrls.loginUrl}?email=$emailAddress&password=$Password",
        ),
      );

      print("Response Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        print("Data: $data");

        String success = data[1]['success'].toString();
        String message = data[2]['message'].toString();

        if (success == "yes") {
          String userId = data.length > 3
              ? data[3]['id'].toString()
              : "";

          print("User ID: $userId");

          await sp.setString('userId', userId);

          Get.showSnackbar(
            GetSnackBar(
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
              title: "Success",
              message: message,
            ),
          );

          Get.offAll(() => HomeScreen());
        } else {
          Get.showSnackbar(
            GetSnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
              title: "Error",
              message: message,
            ),
          );
        }
      } else {
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
            title: "Error",
            message: "Server Error",
          ),
        );
      }
    } catch (e) {
      print("Error Catch: $e");

      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          title: "Error",
          message: e.toString(),
        ),
      );
    }
  }}
