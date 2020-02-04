import 'package:clima/screens/location_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

const apiKey = 'da2d576dc46206d8b221726a99f15382';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocData();
  }

  void getLocData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocWeather();

//    Location location = Location();
//    await location.getCurrentLoc();
//    latitude = location.latitude;
//    longitude = location.longitude;
//
//    NetworkHelper networkHelper = NetworkHelper(
//        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=cda7559df1f7a8bb34a411d51c428169&units=metric');
//
//    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationScreen: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
//    String myMargin = '15';
//    double mYmarginAsDou;
//    try {
//      mYmarginAsDou = double.parse(myMargin);
//    } catch (e) {
//      print(e);
//    }
//    return Scaffold(
//      body: Container(
//        color: Colors.redAccent,
//        margin: EdgeInsets.all(mYmarginAsDou ?? 30.0),
//      ),
//    );
  }
}
