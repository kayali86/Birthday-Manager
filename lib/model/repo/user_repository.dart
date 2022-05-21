import 'package:birthday_manager/model/entity/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _db;

  UserRepository(
      {FirebaseAuth? firebaseAuth, FirebaseFirestore? firebaseFirestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _db = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String displayName,
      required DateTime birthday}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    var currentUser = _firebaseAuth.currentUser;

    if (currentUser != null) {
      final user = <String, dynamic>{
        "Birthday": birthday,
        "DisplayName": displayName
      };
      _db.collection("users").doc(currentUser.uid).set(user);
      await currentUser.updateDisplayName(displayName);
    }
  }

  Future signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<String> getUser() async {
    return _firebaseAuth.currentUser!.displayName!;
  }

  Future<List<BmUser>> getAlUsers() async {
    QuerySnapshot querySnapshot = await _db.collection('users').get();
    return querySnapshot.docs
        .map((doc) => BmUser(doc.id, doc["DisplayName"], doc["Birthday"]))
        .toList();
  }
}
