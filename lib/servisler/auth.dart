import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authservisi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //giris
  Future<User?> giris(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  // cıkıs

  cikis() async {
    return await _auth.signOut();
  }

  //kayıt
  Future<User?> kayit(String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firebaseFirestore.collection("user").doc(user.user!.uid).set({
      "email": email,
      "password": password,
    });
    return user.user;
  }

  Future<User?> Post(String notadi, String not) async {
    final now = DateTime.now();

    await _firebaseFirestore
        .collection("post")
        .doc(now.microsecondsSinceEpoch.toString())
        .set({
      "postId": now.microsecondsSinceEpoch.toString(),
      "id": _auth.currentUser!.uid,
      "notadi": notadi,
      "not": not,
    });
  }

  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firebaseFirestore.collection('post').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
