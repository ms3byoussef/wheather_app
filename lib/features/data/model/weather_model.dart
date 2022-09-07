class CurrentWeatherModel {
  final WeatherLocation location;
  final WeatherCurrent current;
  final ForecastDay? forecastDay;
  final ForecastAstro? forecastAstro;
  final List<ForecastHour>? forecastHour;

  CurrentWeatherModel({
    required this.location,
    required this.current,
    this.forecastDay,
    this.forecastAstro,
    this.forecastHour,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      location:
          WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
      current: WeatherCurrent.fromJson(json['current'] as Map<String, dynamic>),
      forecastDay: ForecastDay.fromJson(
          json['forecast']['forecastday'][0]['day'] as Map<String, dynamic>),
      forecastAstro: ForecastAstro.fromJson(
          json['forecast']['forecastday'][0]['astro'] as Map<String, dynamic>),
      forecastHour: List<ForecastHour>.from(json['forecast']['forecastday'][0]
              ['hour']
          .map((x) => ForecastHour.fromJson(x))),
    );
  }
}

class WeatherLocation {
  final String name;
  final String country;
  final double lat;
  final double lon;

  WeatherLocation({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) {
    return WeatherLocation(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
    );
  }
}

class WeatherCurrent {
  final double tempC;
  final double tempF;
  final String conditionText;
  final String? conditionIcon;
  final double? windSpeedKM;
  final int? humidity;
  final int? cloud;

  WeatherCurrent({
    required this.tempC,
    required this.tempF,
    required this.conditionText,
    this.conditionIcon,
    this.windSpeedKM,
    this.humidity,
    this.cloud,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherCurrent(
      tempC: json['temp_c'] as double,
      tempF: json['temp_f'] as double,
      conditionText: json['condition']['text'] as String,
      conditionIcon: json['condition']['icon'] as String,
      windSpeedKM: json['wind_kph'] as double,
      humidity: json['humidity'],
      cloud: json['cloud'],
    );
  }
}

class ForecastDay {
  final double? maxTempC;
  final double? minTempC;
  final double? avgTempC;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final String? conditionText;
  final String? conditionIcon;

  ForecastDay({
    this.maxTempC,
    this.minTempC,
    this.avgTempC,
    this.conditionIcon,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.conditionText,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      maxTempC: json['maxtemp_c'] as double,
      minTempC: json['mintemp_c'] as double,
      avgTempC: json['avgtemp_c'] as double,
      dailyWillItRain: json['daily_will_it_rain'] as int,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int,
      dailyWillItSnow: json['daily_will_it_snow'] as int,
      dailyChanceOfSnow: json['daily_chance_of_snow'] as int,
      conditionText: json['condition']['text'] as String,
      conditionIcon: json['condition']['icon'] as String,
    );
  }
}

class ForecastAstro {
  final String? sunRise;
  final String? sunSet;
  final String? moonRise;
  final String? moonSet;
  final String? moonPhase;

  ForecastAstro({
    this.sunRise,
    this.sunSet,
    this.moonRise,
    this.moonSet,
    this.moonPhase,
  });

  factory ForecastAstro.fromJson(Map<String, dynamic> json) {
    return ForecastAstro(
      sunRise: json['sunrise'] as String,
      sunSet: json['sunset'] as String,
      moonRise: json['moonrise'] as String,
      moonSet: json['moonset'],
      moonPhase: json['moon_phase'] as String,
    );
  }
}

class ForecastHour {
  final String? time;
  final double? tempC;
  final int? isDay;
  final String? conditionText;
  final String? conditionIcon;

  ForecastHour({
    this.time,
    this.tempC,
    this.isDay,
    this.conditionText,
    this.conditionIcon,
  });

  factory ForecastHour.fromJson(Map<String, dynamic> json) {
    return ForecastHour(
      time: json['time'] as String,
      tempC: json['temp_c'] as double,
      isDay: json['is_day'] as int,
      conditionText: json['condition']['text'] as String,
      conditionIcon: json['condition']['icon'] as String,
    );
  }
}
