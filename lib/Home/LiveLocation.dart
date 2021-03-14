import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class LiveLocation extends StatefulWidget {
  LiveLocation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LiveLocationState createState() => _LiveLocationState();
}

enum LocationAccuracy {
  POWERSAVE, // To request best accuracy possible with zero additional power consumption,
  LOW, // To request "city" level accuracy
  BALANCED, // To request "block" level accuracy
  HIGH, // To request the most accurate locations available
  NAVIGATION // To request location for navigation usage (affect only iOS)
}

class _LiveLocationState extends State<LiveLocation> {
  Completer<GoogleMapController> _controller = Completer();
  var currentLocation = LocationData;
  var location = new Location();

  double lat;
  double long;
  String msg;

  @override
  initState() {
    super.initState();
    _liveLocation();
  }

  Future<void> _liveLocation() async {
    GoogleMapController controller = await _controller.future;
    location.onLocationChanged().listen((LocationData currentLocation) {

      lat = currentLocation.latitude; //latitude
      long = currentLocation.longitude; //longitude

      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          bearing: 351.8334901395799,
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          tilt: 59.440717697143555,
          zoom: 19.151926040649414)));
    });
  }

  void _share(){
    //SmsCRUDPageState().setMessage("https://www.google.com/maps/search/?api=1&query=${lat},${long} \n I'm in a trouble, please help !!! \n You can check my current location here.");
    Share.share("https://www.google.com/maps/search/?api=1&query=${lat},${long} \nI'm in a trouble, please help !!! \nYou can check my current location here.");
  }




  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:
      Text("My Location"),),
      body: GoogleMap(
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _share,
        label: Text('Share Location'),
        icon: Icon(Icons.my_location),
      ),
    );
  }


}
