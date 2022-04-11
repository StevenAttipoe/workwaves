// import 'package:firebase_auth/firebase_auth.dart';

// class AuthenticationController {
//     final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   AuthenticationController(FirebaseAuth instance);

//   /// Changed to idTokenChanges as it updates depending on more cases.
//   Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

//   Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }

//   Future<String?> signIn({required String email, required String password}) async {
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

  
//   Future<String?> signUp({required String email, required String password}) async {
//     try {
//       await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//       return "Signed up";
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
// }