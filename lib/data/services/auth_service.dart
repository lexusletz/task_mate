import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class AuthService extends GetxService {
  Rx<bool> isLoged = false.obs;

  AppUser getCurrentUser() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      var user = AppUser(
        uid: currentUser.uid,
        name: currentUser.displayName ?? "",
        email: currentUser.email ?? "",
        photoUrl: currentUser.photoURL ?? "",
      );
      return user;
    }
    return AppUser(uid: '', name: '', email: '', photoUrl: '');
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
