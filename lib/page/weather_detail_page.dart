import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app_v1/constant/app_config.dart';
import 'package:weather_app_v1/model/weather_data.dart';

class WeatherDetailPage extends StatelessWidget {
  final String cityName;
  final String? apiKey = String.fromEnvironment('API_KEY');

  WeatherDetailPage({
    super.key,
    required this.cityName,
  });

  // APIからデータを取ってくる関数
  Future<WeatherData> fetchWeather() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${AppConfig.apiKey}&units=metric&lang=ja';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('データの取得に失敗しました');
    }
  }

  // 表示
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('天気詳細')),
      body: FutureBuilder<WeatherData>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          final weather = snapshot.data;
          if (weather == null) {
            return SizedBox.shrink();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('yyyy/MM/dd HH:mm').format(weather.date),
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  weather.cityName,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.network(
                  'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                ),
                Text(weather.description, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '最高: ${weather.tempMax.toStringAsFixed(1)}℃',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '最低: ${weather.tempMin.toStringAsFixed(1)}℃',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text('湿度: ${weather.humidity}%'),
              ],
            ),
          );
        },
      ),
    );
  }
}
