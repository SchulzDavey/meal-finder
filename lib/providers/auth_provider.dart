import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:meal_finder/models/auth_user.dart';

class AuthNotifier extends StateNotifier<AuthUser?> {
  AuthNotifier() : super(null);

  void setUser() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      final userDB = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      final user = AuthUser(
        id: currentUser.uid,
        email: currentUser.email!,
        username: userDB['username'],
        imageUrl: userDB['imageUrl'],
      );

      state = user;
    } catch (error) {
      print(error);
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthUser?>((ref) {
  return AuthNotifier();
});
