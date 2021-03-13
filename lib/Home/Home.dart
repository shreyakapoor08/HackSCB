import 'package:flutter/material.dart';
import 'package:women_safety_app/size_conifg.dart';

import '../size_config.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),

      //drawer to be added here

    );
  }

}
