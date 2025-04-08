import 'package:e_commerce_application/model/user/user_model.dart';
import 'package:flutter/material.dart';

class RegisterScreen4 extends StatefulWidget {
  final UserModel? userDetailObject;
  const RegisterScreen4({Key? key, this.userDetailObject}) : super(key: key);

  @override
  _RegisterScreen4State createState() => _RegisterScreen4State();
}

class _RegisterScreen4State extends State<RegisterScreen4> {
  late UserModel _userDetailObject;
  @override
  void initState() {
    super.initState();
    _userDetailObject = widget.userDetailObject!;
  }

  final _usernameEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  void _submit() {
    if (_usernameEmailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Fill All Required Fields!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }

    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Passwords do not match!",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }

    if (_usernameEmailController.text.trim().contains('@')) {
      _userDetailObject.email = _usernameEmailController.text.trim();
    } else {
      _userDetailObject.userName = _usernameEmailController.text.trim();
    }
    _userDetailObject.password = _passwordController.text.trim();

    print(_userDetailObject);
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Create User",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 40),

            TextField(
              controller: _usernameEmailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.supervised_user_circle_rounded),
                labelText: "Username/Email",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: _obscureTextPassword,
              decoration: InputDecoration(
                labelText: "Password",
                icon: Icon(Icons.password),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureTextPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureTextPassword = !_obscureTextPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureTextConfirmPassword,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                icon: Icon(Icons.password_sharp),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureTextConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureTextConfirmPassword =
                          !_obscureTextConfirmPassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                "Create",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),

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
