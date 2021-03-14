import 'package:flutter/material.dart';
import 'WebView.dart';
import 'LiveLocation.dart';
import 'package:call_number/call_number.dart';

class SubHome extends StatefulWidget {
  createState()
  {
    return _Home1();
  }

}


class _Home1 extends State<SubHome> {

  _dialog (BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        // color: Colors.white,
        height: 550,
        width: 400,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(

              width:200,
              height: 150,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),),
                elevation: 8.0,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.safeBlockVertical* 4,),
                      Icon(Icons.flash_on ,size: SizeConfig.safeBlockVertical* 5,),
                      SizedBox(height: SizeConfig.safeBlockVertical* 1,),
                      Text('Fire',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black),),
                    ],
                  ),
                ),
                color:Colors.blue[200],
                onPressed: (){
                  number.text = '101';
                  CallNumber().callNumber(number.text);
                },
              ),
            ),
            SizedBox(height: 10,),
            Container(

              width:200,
              height: 150,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),),
                elevation: 8.0,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.safeBlockVertical* 4,),
                      Icon(Icons.add_circle_outline,size: SizeConfig.safeBlockVertical* 5,),
                      SizedBox(height: SizeConfig.safeBlockVertical* 1,),
                      Text('Ambulance',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black),),
                    ],
                  ),
                ),
                color:Colors.blue[500],
                onPressed: (){
                  number.text = '102';
                  CallNumber().callNumber(number.text);
                },
              ),
            ),

            SizedBox(height: 10,),
            Container(

              width:200,
              height: 150,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),),
                elevation: 8.0,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.safeBlockVertical* 4,),
                      Icon(Icons.person,size: SizeConfig.safeBlockVertical* 5,),
                      SizedBox(height: SizeConfig.safeBlockVertical* 1,),
                      Text('Police',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black),),
                    ],
                  ),
                ),
                color:Colors.blue[600],
                onPressed: (){
                  number.text = '100';
                  CallNumber().callNumber(number.text);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }


  requestCameraPermission() async {
    final res = await Permission.requestPermissions([PermissionName.Camera,]);
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
  final number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      Container(
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(20,10,20,10),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            crossAxisCount: 1,
            childAspectRatio: 4 / 2,

            children: <Widget>[

        Container(
        // color: Colors.green,
        margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(150.0),),
          elevation: 8.0,
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.safeBlockVertical* 4,),
                Icon(Icons.contact_phone,size: SizeConfig.safeBlockVertical* 5,),
                SizedBox(height: SizeConfig.safeBlockVertical* 1,),
                Text('SOS',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black),),
              ],
            ),
          ),
          color:Colors.red[400],
          onPressed: (){
            number.text = '112';
            CallNumber().callNumber(number.text);
          },
        ),
      ),

      Column(
          children: [
      RaisedButton(

      shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),),
    elevation: 8.0,
    child: Center(
    child: Column(
    children: <Widget>[
    SizedBox(height: SizeConfig.safeBlockVertical* 4,),
    Icon(Icons.message,size: SizeConfig.safeBlockVertical* 5,),
    SizedBox(height: SizeConfig.safeBlockVertical* 1,),
    Text('SMS',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black),),
    ],
    ),
    ),
    color:Colors.blue[200],
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Sms()));
    },
    ),
    ),


    SizedBox(width: 10,),
    RaisedButton(
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(18.0),),
    elevation: 8.0,
    child: Column(
    children: <Widget>[
    SizedBox(height: SizeConfig.safeBlockVertical* 4,),
    Icon(Icons.call,size: SizeConfig.safeBlockVertical* 5,),
    SizedBox(height: SizeConfig.safeBlockVertical* 1,),
    Text('Call',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black,),),
    ],
    ),
    color:Colors.blue[200],
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => call()));
    },
    ),
    ),



    ],
    ),


    Row(
    children: [
    RaisedButton(
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(18.0),),
    elevation: 8.0,
    child: Column(
    children: <Widget>[
    SizedBox(height: SizeConfig.safeBlockVertical* 4,),
    Icon(Icons.my_location,size: SizeConfig.safeBlockVertical* 5,),
    SizedBox(height: SizeConfig.safeBlockVertical* 1,),
    Text('My Location',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 2.9,color: Colors.black),),
    ],
    ),
    color:Colors.blue[400],
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => loc()));
    },



    ),
    ),


    RaisedButton(
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(18.0),),
    elevation: 8.0,
    color:Colors.blue[500],
    child: Center(
    child: Column(
    children: <Widget>[
    SizedBox(height: SizeConfig.safeBlockVertical* 4,),
    Icon(Icons.offline_bolt,size: SizeConfig.safeBlockVertical* 5,),
    SizedBox(height: SizeConfig.safeBlockVertical* 1,),
    Text('Emergency numbers',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black),),
    ],
    ),
    ),
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => WebView()));

    },
    ),
    ),
    ],
    ),





    RaisedButton(
    shape: new RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(18.0),),
    elevation: 8.0,
    child: Center(
    child: Column(
    children: <Widget>[
    SizedBox(height: SizeConfig.safeBlockVertical* 4,),
    Icon(Icons.accessibility_new,size: SizeConfig.safeBlockVertical* 5,),
    SizedBox(height: SizeConfig.safeBlockVertical* 1,),
    Text('Disaster',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black),),
    ],
    ),
    ),
    color:Colors.blue[500],
    onPressed: (){
    _

    return _dialog;
    },
    ),



    ],
    ),
    ),
    );
  }

}
