import 'package:flutter/material.dart';
import 'package:women_safety_app/Home/ContactUs.dart';
import 'package:women_safety_app/Home/Guide.dart';
import 'package:women_safety_app/Home/subHome.dart';
import '../firebase_auth_utils.dart';
import 'call.dart';
import 'sms.dart';


class Home extends StatefulWidget {
  AuthFunc auth;
  VoidCallback onSignOut;
  String userId, userEmail;

  Home({Key key, this.auth, this.onSignOut, this.userId, this.userEmail})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}