import 'package:http/http.dart' as http;

class FeatchWeatherApi {
  static const String apiKey = "YOUR OPENWEATHER API Key";

  Future fetchCurrentWeather(latitude, longitude) async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

      final response = await http.get(Uri.parse(url));
      var data = response.body;

      return data;
    } catch (e) {
      print(e);
    }
  }

  Future fetchNextDaysWeather(latitude, longitude) async {
    try {
      String url =
          "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

      final response = await http.get(Uri.parse(url));
      var data = response.body;

      return data;
    } catch (e) {
      print(e);
    }
  }
}
