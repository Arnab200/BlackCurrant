import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(LocationManager());

class LocationManager extends StatefulWidget {
  @override
  _LocationManagerState createState() => _LocationManagerState();
}

class _LocationManagerState extends State<LocationManager> {
  Location location = new Location();
  double Latitude = 0;
  double Longitude = 0;

  Map<String, double> currentLocation;

  @override
  void initState() {
    super.initState();
    location.onLocationChanged().listen((value) {
      setState(() {
        currentLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LocationManager',
        home: Scaffold(
            appBar: AppBar(
              title: Text('LocationManager'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[currentLocation == null ? CircularProgressIndicator():
                  Text("Lat: ${Latitude}" + " " + "Long: ${Longitude}" ),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: getLocation,
                    child: const Text('Get Location',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            )));
  }

  void getLocation(){
    Latitude = currentLocation['latitude'];
    Longitude = currentLocation['longitude'];
  }

}
