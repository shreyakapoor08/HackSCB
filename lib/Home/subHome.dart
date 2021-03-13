import 'package:flutter/material.dart'; //for material design

import 'package:women_safety_app/size_conifg.dart'; //for media query

import '../size_config.dart'; //for media query



class SubHome extends StatefulWidget {
  createState()
  {
    return _Home1();
  }

}


class _Home1 extends State<SubHome> {

  final number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        crossAxisCount: 2,
        children: <Widget>[
          RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),),
            elevation: 8.0,
            color:Colors.blue[400],
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

          ),
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

          ),


          RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),),
            elevation: 8.0,
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.safeBlockVertical* 4,),
                Icon(Icons.contacts,size: SizeConfig.safeBlockVertical* 5,),
                SizedBox(height: SizeConfig.safeBlockVertical* 1,),
                Text('Personal Contacts',style: TextStyle(fontSize: SizeConfig.safeBlockVertical* 3,color: Colors.black,),),
              ],
            ),
            color:Colors.blue[200],

          ),
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
            color:Colors.blue[500],


            //google_maps_flutter: ^0.5.21+7

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

          ),
          RaisedButton(
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),),
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
            color:Colors.blue[200],

          ),
          RaisedButton(
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

          ),
          RaisedButton(
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

          ),
        ],
      ),
    );
  }

}