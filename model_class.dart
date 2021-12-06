import 'package:cloud_firestore/cloud_firestore.dart';

class ModelClass {
  //
  late String id;
  late String name;
  late String email;

  ModelClass({required this.name, required this.email});

  //
  ModelClass.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    this.id = snapshot.id;
    this.name = snapshot['name'];
    this.email = snapshot['email'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map['name'] = this.name;
    map['email'] = this.email;

    return map;
  }
}
