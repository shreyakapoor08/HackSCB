import 'package:flutter/material.dart';
import 'package:women_safety_app/Home/Home.dart';

// Horizontal 1 % = 3.55
// Vertical   1 % = 7.75

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "One Tap Lifeline",
      debugShowCheckedModeBanner: false,
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyAppHomeState();
}


class _MyAppHomeState extends State<MyAppHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Home();
  }


}
