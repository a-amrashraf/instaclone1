import 'package:flutter/material.dart';
import 'package:instaclone1/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // username,email and pw text controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

// tap to go to login page
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // password match -> create user
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // passwords dont match -> tell user to fix

    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 25),

            //welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // username textfield
            MyTextfield(
              hintText: "Username",
              obsecureText: false,
              controller: _usernameController,
            ),

            const SizedBox(height: 10),

            // email textfield
            MyTextfield(
              hintText: "Email",
              obsecureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            // password textfield
            MyTextfield(
              hintText: "Password",
              obsecureText: true,
              controller: _pwController,
            ),

            const SizedBox(height: 10),

            // confirm password textfield
            MyTextfield(
              hintText: "Confirm Password",
              obsecureText: true,
              controller: _confirmpwController,
            ),

            const SizedBox(height: 25),

            // login button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
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
