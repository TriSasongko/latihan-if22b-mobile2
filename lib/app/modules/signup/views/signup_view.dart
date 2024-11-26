import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final cAuth = Get.find<AuthController>();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up to Get Started',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                ),
                const SizedBox(height: 40),
                
                // Email Input
                TextFormField(
                  controller: controller.cEmail,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                ),
                const SizedBox(height: 15),
                
                // Password Input
                TextFormField(
                  controller: controller.cPass,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                ),
                const SizedBox(height: 25),
                
                // Sign Up Button with Refined Gradient
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0.5, -1.5), // Slightly shifted up for a centered effect
                      radius: 2.5,
                      colors: [
                        Color(0xFF9B67FF),
                        Color(0xFF7854FA),
                        Color(0xFF4B3ECD),
                        Color(0xFF1A28A1),
                      ],
                      stops: [0.1, 0.4, 0.7, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      cAuth.signup(controller.cEmail.text, controller.cPass.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Text untuk Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Log In", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                
                // Text "Or Continue With"
                Text(
                  "Or",
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 15),

                // Social Media Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook),
                      color: Color(0xFF4267B2),
                      iconSize: 35,
                      onPressed: () {
                        // Fungsi login Facebook
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.g_mobiledata),
                      color: Color(0xFFDB4437),
                      iconSize: 35,
                      onPressed: () {
                        // Fungsi login Google
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.alternate_email),
                      color: Color(0xFF1DA1F2),
                      iconSize: 35,
                      onPressed: () {
                        // Fungsi login Twitter
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
