import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthDataSource({required this.firebaseAuth});

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    return userCredential.user!;
  }

  Future<User> createUserWithEmailAndPassword(String email,
      String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user!;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

}