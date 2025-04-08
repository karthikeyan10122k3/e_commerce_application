import 'dart:math';

import 'package:e_commerce_application/model/user/user_model.dart';
import 'package:e_commerce_application/screens/(Auth)/registration/register_screen_2.dart';
import 'package:e_commerce_application/widgets/custom_app_bar.dart';
import 'package:e_commerce_application/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({super.key});

  @override
  _RegisterScreen1State createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  final _mobileNumberController = TextEditingController();
  final _userOptController = TextEditingController();
  int _otp = 0;
  UserModel? _userDetailObject;
  bool _showOptWidget = false;

  void _submit() {
    if (_mobileNumberController.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Enter a 10 Digit Number!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }

    setState(() {
      _userDetailObject = UserModel(
        mobile: int.parse(_mobileNumberController.text.trim()),
      );
      _showOptWidget = true;
    });

    final random = Random();
    _otp = 1000 + random.nextInt(9000);
    debugPrint("Generated OTP: $_otp"); // Optional for developers
  }

  void _otpVerification() {
    if (_otp != int.parse(_userOptController.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Opt Number Invalid!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }
    setState(() {
      _userDetailObject?.isVerified = true;
    });
    if (_userDetailObject != null && _userDetailObject?.isVerified == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Mobile number not Verified!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Mobile number Verified!",
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => RegisterScreen2(userDetailObject: _userDetailObject!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: const CustomAppBar(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter Mobile Number to Send OTP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _mobileNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "mobile",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Send",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              if (_showOptWidget == true) ...[
                const SizedBox(height: 20),

                Text(
                  "Enter the OTP sent to your mobile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _userOptController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "otp",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _otpVerification,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent,
                    ),
                    child: const Text(
                      "Go Back",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        () => Navigator.of(
                          context,
                        ).pushNamedAndRemoveUntil('/login', (route) => false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent,
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
