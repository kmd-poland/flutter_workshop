import 'dart:math';

class WeatherService {
  static final WeatherService _instance = WeatherService._internal();

  WeatherService._internal();

  factory WeatherService.get() {
    return _instance;
  }

  List<String> getLocation(String locationName) {
    return [
      "Hellsinki Wielkie",
      "Hellsinki Małe",
      "Hellsinki Dolne",
      "Hellsinki Górne",
      locationName
    ];
  }

  WeatherDetails getWeather(String locationName) {
    Random rand = Random();
    return WeatherDetails(rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 360, WeatherType.values[rand.nextInt(WeatherType.values.length)]);
  }
}

enum WeatherType {
  Cloudy,
  Rainy,
  Foggy,
  Sunny,
}

class WeatherDetails {
  final double Temperature;
  final double Preassure;
  final double WindSpeed;
  final double WindDirection;
  final WeatherType Type;

  WeatherDetails(this.Temperature, this.Preassure, this.WindSpeed,
      this.WindDirection, this.Type);
}


