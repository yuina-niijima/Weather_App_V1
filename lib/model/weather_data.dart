// コードの参考：https://hiyoko-programming.com/2571/
// APIから届くUTC時刻を取得：https://api.flutter.dev/flutter/dart-core/DateTime-class.html

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
    // utcdate:APIから届いた世界共通の基準時間（UTC)
    // fromMillisecondsSinceEpo：人間がわかる日付と時刻に変換
    // jsonから持ってきた数字をミリ秒に変換
    // isUtc:届いた数字をとりあえず世界共通の基準点として固定する
    final utcDate = DateTime.fromMillisecondsSinceEpoch(
      json['dt'] * 1000,
      isUtc: true,
    );

    // APIから届く timezone（秒）を取得。例：東京なら 32400 (9時間)
    final int offsetSeconds = json['timezone'] ?? 0;

    // UTC時刻に時差を加算して「現地時間」を作る
    // offsetSeconds: APIが教えてくれた「その都市とUTCとの時差」を秒で表した数字（例：東京なら32400秒)
    // Duration(seconds: ...): 「〇〇秒間」という時間の長さを作るための箱
    final dateTime = utcDate.add(Duration(seconds: offsetSeconds));
    return WeatherData(
      cityName: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      tempMax: (json['main']['temp_max']),
      tempMin: (json['main']['temp_min']),
      humidity: json['main']['humidity'],
      date: dateTime,
    );
  }
}
