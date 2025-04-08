import 'package:e_commerce_application/model/user/user_model.dart';
import 'package:e_commerce_application/screens/(Auth)/registration/register_screen_4.dart';
import 'package:flutter/material.dart';

class RegisterScreen3 extends StatefulWidget {
  final UserModel userDetailObject;
  const RegisterScreen3({super.key, required this.userDetailObject});

  @override
  _RegisterScreen3State createState() => _RegisterScreen3State();
}

class _RegisterScreen3State extends State<RegisterScreen3> {
  late UserModel _userDetailObject;
  @override
  void initState() {
    super.initState();
    _userDetailObject = widget.userDetailObject;
  }

  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipCodeController = TextEditingController();

  void _submit() {
    if (_countryController.text.isEmpty &&
        _stateController.text.isEmpty &&
        _cityController.text.isEmpty &&
        _zipCodeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Enter Required Fields!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
    setState(() {
      _userDetailObject.country = _countryController.text.trim();
      _userDetailObject.state = _stateController.text.trim();
      _userDetailObject.city = _cityController.text.trim();
      _userDetailObject.zipCode = int.parse(_zipCodeController.text.trim());
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => RegisterScreen4(userDetailObject: _userDetailObject),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: const CustomAppBar()),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Enter Location Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _countryController,
                    decoration: const InputDecoration(
                      hintText: "country",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _stateController,
                    decoration: const InputDecoration(
                      hintText: "state",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: "city",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _zipCodeController,
                    decoration: const InputDecoration(
                      hintText: "zip Code",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => RegisterScreen4(
                              userDetailObject: _userDetailObject,
                            ),
                      ),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                  ),
                  child: const Text(
                    "Go Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(context, '/'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
