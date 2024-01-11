import 'package:flutter/material.dart';
import 'package:mistrioncall/ui/Provider/bottomnavigation.dart';
import 'package:mistrioncall/ui/Welcome/signupscreen.dart';

import '../../utils/constants/AppColor.dart';
import '../home/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 36.0),
              const SizedBox(height: 36.0),
              const Center(
                child: Text(
                  'Hello User!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0, // Adjust the font size as needed
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Center(
                child: Text(
                  'Signup For Better Experience',
                  style: TextStyle(
                    fontSize: 18.0, // Adjust the font size as needed
                  ),
                ),
              ),
              const SizedBox(height: 46.0),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: const Icon(
                    Icons.email,
                    color: Colors.grey, // Replace with your desired color
                  ),
                  fillColor: AppColor.lightblue,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Email',
                ),
                // validator: _validateFullName,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: const Icon(
                    Icons.password,
                    color: Colors.grey, // Replace with your desired color
                  ),
                  fillColor: AppColor.lightblue,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Password',
                ),
                // validator: _validateFullName,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false, // Remember Me checkbox value
                        onChanged: (bool? value) {
                          // TODO: Implement your logic when Remember Me is changed
                        },
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement your forget password logic
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            Home() // Replace with your next screen widget
                        ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColor.blue, // Set your desired background color
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Set your desired text color
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            const SignUpScreen() // Replace with your next screen widget
                        ),
                  );
                },
                child: const Text('Don\'t have an account? Sign Up.'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Or Continue With',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300, // Set the desired width
                height: 55, // Set the desired height
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Adjust spacing as needed
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        // Make button transparent
                        shadowColor: Colors.transparent, // Remove button shadow
                      ),
                      onPressed: () {
                        // TODO: Add Google authentication logic
                      },
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 24, // Adjust the height as needed
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        // Make button transparent
                        shadowColor: Colors.transparent, // Remove button shadow
                      ),
                      onPressed: () {
                        // TODO: Add Facebook authentication logic
                      },
                      child: Image.asset(
                        'assets/images/call.png',
                        height: 24, // Adjust the height as needed
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
