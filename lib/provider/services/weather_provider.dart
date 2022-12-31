import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/models/current_weather.dart';
import 'package:weather_app/provider/api/fetch_weather.dart';

class WeatherProvider with ChangeNotifier {
  // bool _loading = true;
  // bool get loading => _loading;

  double _latitude = 0.0;
  double get latitude => _latitude;

  double _longitude = 0.0;
  double get longitude => _longitude;

  String _city = "";
  String get city => _city;

  String _state = "";
  String get state => _state;

  getcurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _latitude = position.latitude;
    _longitude = position.longitude;
    await getAddress();
    notifyListeners();
  }

  getAddress() async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(_latitude, _longitude);
    Placemark place = placemark[0];

    _city = '${place.locality!},';
    _state = place.administrativeArea!;

    notifyListeners();
  }

  Future<CurrentWeather> getCurrentWeather() async {
    var res =
        await FeatchWeatherApi().fetchCurrentWeather(_latitude, _longitude);
    var data = jsonDecode(res);

    return CurrentWeather.fromJson(data);
  }

  Future<ActualNextDaysWeather> getNextDaysWeather() async {
    var res =
        await FeatchWeatherApi().fetchNextDaysWeather(_latitude, _longitude);
    var data = jsonDecode(res);
    return ActualNextDaysWeather.fromJson(data);
  }
}
