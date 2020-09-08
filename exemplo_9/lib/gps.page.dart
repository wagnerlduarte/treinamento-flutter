import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsPage extends StatefulWidget {
  @override
  _GpsPageState createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  double latitude;
  double longitude;
  bool isLoading = false;

  getLastKnowLocation() async {
    setState(() {
      isLoading = true;
    });

    Position position = await getLastKnownPosition();

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      isLoading = false;
    });
  }

  _getLocation() async {
    setState(() {
      isLoading = true;
    });

    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getLastKnowLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.gps_fixed),
        onPressed: () => _getLocation(),
      ),
      body: Container(
        child: isLoading
            ? Center(
                child: Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  Text('Latitude $latitude'),
                  Text('Longitude $longitude')
                ],
              ),
      ),
    );
  }
}
