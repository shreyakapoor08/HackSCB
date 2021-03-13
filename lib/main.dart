import 'package:flutter/material.dart';
import 'package:women_safety_app/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/firebase_auth_utils.dart';
import 'Login.dart';
import 'package:shake/shake.dart';
import 'package:call_number/call_number.dart';

void main() => runApp(MyApp());   // App starts running from here

class MyApp extends StatelessWidget // stateless Widgets dont have any Ui changes
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WeSafe",  //Name of the App
      debugShowCheckedModeBanner: false,
      home: MyAppHome(auth: MyAuth()), //Auth is used through firebase
    );
  }
}

class MyAppHome extends StatefulWidget {
  MyAppHome({this.auth});
  AuthFunc auth;  //object for AuthFunc Class defined in FirebaseAuthUtils

  @override
  State<StatefulWidget> createState() => _MyAppHomeState();
}

enum AuthStatus { NOT_LOGIN, NOT_DETERMINED, LOGIN }

class _MyAppHomeState extends State<MyAppHome> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "", _userEmail = "";

  
  @override
  void initState() {
  // To implement the important things first, firebase and shake related
    
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
          _userEmail = user?.email;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGIN : AuthStatus.LOGIN;
      });
    });

    ShakeDetector.autoStart(
      onPhoneShake: (){

        var text = '112';
        CallNumber().callNumber(text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return _showLoading();
        break;
      case AuthStatus.NOT_LOGIN:
        return Login(auth: widget.auth, onSignedIn: _onSignedIn);
        break;
      case AuthStatus.LOGIN:
        if (_userId.length > 0 && _userId != null) {
          return Home(
              userId: _userId,
              userEmail: _userEmail,
              auth: widget.auth,
              onSignOut: _onSignOut);
        } else
          return _showLoading();
        break;
      default:
        return _showLoading();
        break;
    }
  }

  
  //Sign out funtion using firebase
  void _onSignOut() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGIN;
      _userId = _userEmail = "";
    });
  }
  void out(){
    _onSignOut();
  }

  //Sign in funtion using firebase
  void _onSignedIn() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
        _userEmail = user.email.toString();
      });

      setState(() {
        authStatus = AuthStatus.LOGIN;
      });
    });
  }
}


//Widget to show a circular progress indicator
Widget _showLoading() {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    ),
  );
}
