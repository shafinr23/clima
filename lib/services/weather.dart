import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const openMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '$openMapUrl?q=$cityName&appid=cda7559df1f7a8bb34a411d51c428169&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherDataCity = await networkHelper.getData();

    return weatherDataCity;
  }

  Future<dynamic> getLocWeather() async {
    Location location = Location();
    await location.getCurrentLoc();

    NetworkHelper networkHelper = NetworkHelper(
        '$openMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=cda7559df1f7a8bb34a411d51c428169&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 ';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 ';
    } else {
      return 'Bring a 🧥 just in case ';
    }
  }
}
