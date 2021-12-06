import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shreya_demo/dismisiable/dismisible_demo.dart';
import 'package:shreya_demo/emailandgoogleauth/sign_in.dart';
import 'package:shreya_demo/emailandgoogleauth/welcomesceen.dart';
import 'package:shreya_demo/filters/filter_demo.dart';
import 'package:shreya_demo/phoneverification/phone_verification.dart';
import 'package:shreya_demo/search/add_users_details.dart';
import 'package:shreya_demo/search_demo.dart';

import 'dismisiable/add_data.dart';
import 'search/client_side_search.dart';
import 'search/server_side_search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DismisibleDemo(),
    );
  }
}
