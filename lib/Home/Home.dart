import 'package:flutter/material.dart';
import 'package:women_safety_app/size_conifg.dart';

import 'subHome.dart';

//import '../size_config.dart';


class Home extends StatefulWidget {
  AuthFunc auth;
  VoidCallback onSignOut;
  String userId, userEmail;

  Home({Key key, this.auth, this.onSignOut, this.userId, this.userEmail})
      : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isEmailVerified = false;

  requestCameraPermission() async {
    //final res = await Permission.requestPermissions([PermissionName.Camera,]);
    res.forEach((permission) {
      String a = '${permission.permissionStatus}';
      setState(() {
        if (a == 'PermissionStatus.allow') {
          Lamp.turnOn();
        }
        else {
          Permission.openSettings;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: SubHome(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  SizedBox(height: SizeConfig.safeBlockVertical* 0.5,),
                  Text('One Tap Lifeline',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 4,color: Colors.white),),
                  Icon(Icons.timeline,
                    size: SizeConfig.safeBlockVertical * 13.0,
                    color: Colors.white,)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue[600],
              ),
            ),
            ListTile(
                title: Text('Guide',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5),),
                leading: Icon(
                  Icons.receipt,color: Colors.pink[600],
                  size: SizeConfig.safeBlockVertical * 5,),
                onTap: () {}
            ),
            ListTile(
              title: Text('Call',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5)),
              leading: Icon(
                Icons.call,color: Colors.pink[600],
                size: SizeConfig.safeBlockVertical * 5,),

            ),
            ListTile(
                title: Text('SMS',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5)),
                leading: Icon(
                  Icons.sms,color: Colors.pink[600],
                  size: SizeConfig.safeBlockVertical * 5,),
                onTap: (){
                  // Navigator.pushNamed(context, "/second");

                }
            ),
            ListTile(
              title: Text('Track/Share Location',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5)),
              leading: Icon(
                Icons.location_on,color: Colors.pink[600],
                size: SizeConfig.safeBlockVertical * 5,),
              onTap: (){
              },
            ),
            ListTile(
              title: Text('About',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5)),
              leading: Icon(
                Icons.help,color: Colors.pink[600],
                size: SizeConfig.safeBlockVertical * 5,),
              onTap: (){
                //Navigator.pop(context);
              },
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 32.0,width: 0.0,),
            Container(height: SizeConfig.safeBlockVertical * 0.2,width: SizeConfig.safeBlockHorizontal * 10,
              color: Colors.grey,),
            ListTile(
              title: Text('LOGOUT',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3)),
              leading: Icon(
                Icons.exit_to_app,color: Colors.pink[600],
                size: SizeConfig.safeBlockVertical * 5,),

            ),
          ],
        ),
      ),


    );
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) _showVerifyEmailDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please verify your email'),
            content: Text('We need you to verify your email to continue.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _sendVerifyEmail();
                },
                child: Text('Send me!'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Dismiss'),
              )
            ],
          );
        });
  }

  void _sendVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  

}
