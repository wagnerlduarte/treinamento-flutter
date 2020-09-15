import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:exemplo_9/maps.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsPage extends StatefulWidget {
  @override
  _GpsPageState createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  double _latitude;
  double _longitude;
  bool _isLoading = false;

  getLastKnowLocation() async {
    setState(() {
      _isLoading = true;
    });

    Position position = await getLastKnownPosition();

    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _isLoading = false;
    });
  }

  _getLocation() async {
    setState(() {
      _isLoading = true;
    });

    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _latitude = position.latitude;
      _longitude = position.longitude;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getLastKnowLocation();
  }

  _share() {
    Share.text(
      'Location',
      'Latitude: $_latitude\nLongitude: $_longitude',
      'text/plain',
    );
  }

  _goToMaps() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapsPage(
          latitude: _latitude,
          longitude: _longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.gps_fixed), onPressed: _getLocation,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: _isLoading
            ? Center(
          child: Container(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          ),
        )
            : Column(
          children: [
            Text(
              'Latitude ${_latitude.toStringAsPrecision(6)}',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              'Longitude ${_longitude.toStringAsPrecision(6)}',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            CupertinoButton(
              child: Text('Compartilhar'),
              onPressed: _share,
            ),
            CupertinoButton(
              child: Text('Maps'),
              onPressed: _goToMaps,
            ),
          ],
        ),
      ),
    );
  }
}
