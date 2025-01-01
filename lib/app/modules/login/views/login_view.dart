import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            Image.network(
              "https://static-00.iconduck.com/assets.00/android-plain-wordmark-icon-256x256-ppoejbtc.png",
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cEmail,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: controller.cPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                cAuth.login(controller.cEmail.text, controller.cPass.text);
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 159, 22),
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text("Reset Password"),
                onPressed: () {
                  Get.offAllNamed(Routes.RESETPASSWORD);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum Punya Akun ?"),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.SIGNUP);
                  },
                  child: Text("Daftar Disini"),
                ),
              ],
            ),
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
                  onPressed: () => cAuth.LoginGoogle(),
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
    );
  }
}
