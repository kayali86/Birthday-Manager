import 'package:cloud_firestore/cloud_firestore.dart';

class BmUser {
  String id;
  String displayName;
  Timestamp birthday;

  BmUser(this.id, this.displayName, this.birthday);
}
