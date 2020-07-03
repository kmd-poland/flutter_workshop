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

    List<WeatherDetails> nextDays = [
    WeatherDetails(rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 100, "NW", rand.nextDouble() * 100, WeatherType.values[rand.nextInt(WeatherType.values.length)], List<WeatherDetails>()),
    WeatherDetails(rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 100, "NW", rand.nextDouble() * 100, WeatherType.values[rand.nextInt(WeatherType.values.length)], List<WeatherDetails>()),
    WeatherDetails(rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 100, "NW", rand.nextDouble() * 100, WeatherType.values[rand.nextInt(WeatherType.values.length)], List<WeatherDetails>()),
    ];

    return WeatherDetails(rand.nextDouble() * 100, rand.nextDouble() * 100, rand.nextDouble() * 100, "NW", rand.nextDouble() * 100, WeatherType.values[rand.nextInt(WeatherType.values.length)], nextDays);
  }
}

enum WeatherType {
  Snow,
  Sleet,
  Hail,
  Thunderstorm,
  HeavyRain,
  LightRain,
  Showers,
  HeavyCloud,
  LightCloud,
  Clear
}

class WeatherDetails {
  final double temperature;
  final double pressure;
  final double windSpeed;
  final String windDirection;
  final double humidity;

  final WeatherType type;

  final List<WeatherDetails> nextThreeDays;

  WeatherDetails(this.temperature, this.pressure, this.windSpeed,
      this.windDirection, this.humidity, this.type, this.nextThreeDays);
}


