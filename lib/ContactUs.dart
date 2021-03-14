import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class ContactUs extends StatefulWidget {
  createState()
  {
    return ContactUsState();
  }
}


class ContactUsState extends State<ContactUs> {

  TextStyle textStyle=TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Contact us'),),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                'WeSafe',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 20,),
              Text('Call us - 9123XXXXXX \n'
                  'Mail Us Your Query at- WeSafe@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
                ),
              )
            ],
          ),

        ),
      ),
    );
  }

}
