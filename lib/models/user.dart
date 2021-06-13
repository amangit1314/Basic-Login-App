import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String name;
  late String email;
  late String password;

  UserModel({this.id, this.name, this.email, this.password});

  UserModel.fromDocumentSnapshot({DocumentSnapshot? docsSnapshot}) {
    id = docsSnapshot!.documentsID;
    name = docsSnapshot["name"];
    email = docsSnapshot["email"];
    password = docsSnapshot["password"];
  }
}
