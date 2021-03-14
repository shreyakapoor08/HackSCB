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

class _HomeState extends State<Home> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isEmailVerified = false;


  //int _selectedIndex = 1;

  /*

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  List<Widget> _widgetOptions=<Widget>[
    Text('WORK PAGE HERE',style: TextStyle(fontSize: 36.0),),
    SubHome(),
    Text('SETTINGS',style: TextStyle(fontSize: 36.0),),
    /*
    HomePage(),
    WorkPage(),
    SettingsPage(),
    */
  ];
  */

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
            ListTile(
              child: Column(
                children: <Widget>[
                  SizedBox(height: SizeConfig.safeBlockVertical* 0.5,),
                  Text('WeSafe',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 4,color: Colors.white),),
                  Icon(Icons.group_add,
                    size: SizeConfig.safeBlockVertical * 11.0,
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => g()));

                }
            ),
            ListTile(
                title: Text('Trusted Contacts',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5)),
                leading: Icon(
                  Icons.contact_mail,color: Colors.pink[600],
                  size: SizeConfig.safeBlockVertical * 5,),
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      call()));
                }
            ),


            ListTile(
              title: Text('Track/Share Location',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5)),
              leading: Icon(
                Icons.location_on,color: Colors.pink[600],
                size: SizeConfig.safeBlockVertical * 5,),

            ),
            ListTile(
              title: Text('Contact us',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.5)),
              leading: Icon(
                Icons.help,color: Colors.pink[600],
                size: SizeConfig.safeBlockVertical * 5,),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => cc()));

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
              onTap: (){
                auth.SignOut();
              },
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
          return Dialog(
            title: Text('Please verify your email'),
            content: Text('We need you to verify your email to continue.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {

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
    auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }



  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignOut();
    } catch (e) {
      print(e);
    }
  }
}
