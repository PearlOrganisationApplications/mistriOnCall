import 'package:flutter/material.dart';
import 'package:mistrioncall/Splash/splashscreensec.dart';
import 'package:mistrioncall/Welcome/loginscreen.dart';
import 'package:mistrioncall/constants/AppColor.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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

              Center(child: Image.asset('assets/images/profile.png')),

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

              const SizedBox(height: 26.0),
              TextField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightblue,
                  contentPadding: const EdgeInsets.all(10.0),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Full Name',
                ),
                keyboardType: TextInputType.name,

                // validator: _validateFullName,
              ),

              const SizedBox(height: 16.0),
              TextField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightblue,
                  contentPadding: const EdgeInsets.all(10.0),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'User Name',
                ),
                keyboardType: TextInputType.name,

                // validator: _validateFullName,
              ),


              const SizedBox(height: 16.0),
              TextField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightblue,
                  contentPadding: const EdgeInsets.all(10.0),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,

                // validator: _validateFullName,
              ),


              const SizedBox(height: 16.0),
              TextField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightblue,
                  contentPadding: const EdgeInsets.all(10.0),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.visiblePassword,

                // validator: _validateFullName,
              ),


              const SizedBox(height: 16.0),
              TextField(

                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightblue,
                  contentPadding: const EdgeInsets.all(10.0),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Contact Number',
                ),
                keyboardType: TextInputType.number,

                // validator: _validateFullName,
              ),

              const SizedBox(height: 46.0),
              ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  primary: AppColor.blue, // Set your desired background color
                ),

                child: const Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.white, // Set your desired text color
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>const LoginScreen() // Replace with your next screen widget
                    ),
                  );
                },
                child: const Text('Already have an account? Sign in.'),
              ),


              const SizedBox(
                height: 20,
              ),





            ],
          ),
        ),
      ),
    );
  }
}


