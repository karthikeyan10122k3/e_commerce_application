import 'package:e_commerce_application/model/user/user_model.dart';
import 'package:e_commerce_application/screens/(Auth)/registration/register_screen_3.dart';
import 'package:flutter/material.dart';

class RegisterScreen2 extends StatefulWidget {
  final UserModel userDetailObject;
  const RegisterScreen2({super.key, required this.userDetailObject});

  @override
  _RegisterScreen2State createState() => _RegisterScreen2State();
}

enum Gender { male, female }

class _RegisterScreen2State extends State<RegisterScreen2> {
  late UserModel _userDetailObject;
  Gender? _selectedGender;

  @override
  void initState() {
    super.initState();
    _userDetailObject = widget.userDetailObject;
  }

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();

  void _submit() {
    setState(() {
      _userDetailObject.lastName = _lastNameController.text.trim();
      _userDetailObject.gender =
          _selectedGender.toString().split('.').last.trim();
    });
    if (_firstNameController.text.isEmpty &&
        _dateController.text.isEmpty &&
        _monthController.text.isEmpty &&
        _yearController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Enter Required Fields!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }
    _userDetailObject.firstName = _firstNameController.text.trim();
    final dob =
        "${_dateController.text.trim()}-${_monthController.text.trim()}-${_yearController.text.trim()}";

    setState(() {
      _userDetailObject.dob = dob;
    });

    // print(_userDetailObject);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => RegisterScreen3(userDetailObject: _userDetailObject),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: const CustomAppBar()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Enter Personal Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 40),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      hintText: "First Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Text(
                  "Gender:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text("Male"),
                const SizedBox(width: 20),
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: _selectedGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text("Female"),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      hintText: "DD",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _monthController,
                    decoration: InputDecoration(
                      hintText: "MM",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _yearController,
                    decoration: InputDecoration(
                      hintText: "YYYY",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
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
                  onPressed: () => Navigator.popAndPushNamed(context, '/'),
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
    );
  }
}
