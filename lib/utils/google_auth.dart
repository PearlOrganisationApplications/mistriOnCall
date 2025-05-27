import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mistri_on_call_new/service/authentication.dart';

class GoogleAuthHelper {
  static final googleLoginApi = GoogleLoginApiFunction();

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Returns the current user
  static User? get currentUser => _auth.currentUser;

  /// Sign in with Google
  static Future<User?> signInWithGoogle() async {
    await signOut();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      googleLoginApi.googleLoginUser(userCredential);
      print('user : ${userCredential.user}');
      return userCredential.user;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  /// Sign out from Google
  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  /// Check if user is logged in
  static bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }
}

// class FacebookAuthHelper {
//   static FirebaseAuth _auth = FirebaseAuth.instance;
//
//   static Future<UserCredential?> signInWithFacebook() async {
//     try {
//       // Trigger the sign-in flow
//       final LoginResult result = await FacebookAuth.instance.login();
//
//       if (result.status == LoginStatus.success) {
//         // Obtain the access token
//         final AccessToken accessToken = result.accessToken!;
//
//         // Create a credential from the access token
//         final OAuthCredential credential =
//         FacebookAuthProvider.credential(accessToken.tokenString);
//
//         // Sign in to Firebase with the Facebook credential
//         return await _auth.signInWithCredential(credential);
//       } else {
//         print("Facebook login failed: ${result.status}");
//         return null;
//       }
//     } catch (e) {
//       print("Error during Facebook sign-in: $e");
//       return null;
//     }
//
//     // Get.snackbar(
//     //   'Failed',
//     //   'This feature is not available now',
//     //   snackPosition: SnackPosition.BOTTOM,
//     //   backgroundColor: Colors.red,
//     //   colorText: Colors.white,
//     // );
//   }
//
//   static Future<void> signOut() async {
//     await FacebookAuth.instance.logOut();
//     await _auth.signOut();
//   }
// }

class FacebookAuthHelper {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Sign in with Facebook
  static Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the Facebook Login Flow
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Get the access token
        final AccessToken accessToken = result.accessToken!;

        // Create Firebase credential from Facebook access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        // Sign in to Firebase with the Facebook credential
        return await _auth.signInWithCredential(credential);
      } else {
        print("Facebook login failed: ${result.message}");
        return null;
      }
    } catch (e) {
      Get.snackbar('Failed', 'This feature is not available now',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      print("Error during Facebook sign-in: $e");
      return null;
    }
  }

  /// Sign out from Facebook and Firebase
  static Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }
}




