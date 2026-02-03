// コードの参考：https://hiyoko-programming.com/2571/

class WeatherData {
  final String cityName;
  final String description;
  final String icon;
  final double tempMax;
  final double tempMin;
  final int humidity;
  final DateTime date;

  WeatherData({
    required this.cityName,
    required this.description,
    required this.icon,
    required this.tempMax,
    required this.tempMin,
    required this.humidity,
    required this.date,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      tempMax: (json['main']['temp_max']),
      tempMin: (json['main']['temp_min']),
      humidity: json['main']['humidity'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}
