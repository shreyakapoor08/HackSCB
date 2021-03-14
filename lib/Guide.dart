import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class Guide extends StatefulWidget {
  createState()
  {
    return GuideState();
  }
}


class GuideState extends State<Guide> {

TextStyle textStyle=TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('Guide'),),

        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Text(
                  'Welcome to WeSafe',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10,),


                Text(' WeSafe provides different parts to cover different emergency situations.'
                    'You can use the following features:',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                  fontSize: 20),),

                SizedBox(height: 10,),


                Text(
                  'Add your Trusted Contacts',
                  textAlign: TextAlign.center,

                  style: TextStyle(color: Colors.pink,
                  fontSize: 20),),
                SizedBox(height: 10,),

                Text(
                  'Message your Trusted Contacts That you are in Trouble',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue,
                      fontSize: 20),),

                SizedBox(height: 10,),

                Text(
                  'Share your Current Location ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.pink,
                      fontSize: 20),),
                SizedBox(height: 10,),

                Text(
                  'Call to Numbers like Ambulance, Fire Help etc.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue,
                      fontSize: 20),),
                SizedBox(height: 10,),

                Text(
                  'Shake the phone when you are in an emergency',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.pink,
                      fontSize: 20),),              ],
            ),


        ),
    );
  }

}
