import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(LocationManager());

class LocationManager extends StatefulWidget{
  @override
  _LocationManagerState createState() => _LocationManagerState();
}


class _LocationManagerState extends State<LocationManager>{

  Location location = new Location();

  Map<String, double> currentLocation;

  @override
  void initState(){
    super.initState();
    location.onLocationChanged().listen((value){
      setState((){
        currentLocation = value;
});
    });
}


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'LocationManager',
        home: Scaffold(
      appBar: AppBar(
        title: Text('LocationManager'),
      ),
      body: Center(

        child: Column(
          children: <Widget>[currentLocation == null ?
          CircularProgressIndicator() : Text('Location:' + currentLocation["latitude"].toString() + " " + currentLocation["longitude"].toString()) ],
        ),
      )
    )
    );
  }
}