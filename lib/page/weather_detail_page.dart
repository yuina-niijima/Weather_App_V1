import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app_v1/constant/app_config.dart';
import 'package:weather_app_v1/model/weather_data.dart';

class WeatherDetailPage extends StatelessWidget {
  final String cityName;

  WeatherDetailPage({
    super.key,
    required this.cityName,
  });

  // APIからデータを取ってくる関数
  Future<WeatherData> fetchWeather() async {
    // インジケーターを確認するため三秒待機
    try {
      await Future.delayed(const Duration(seconds: 3));
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${AppConfig.apiKey}&units=metric&lang=ja';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return WeatherData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('データの取得に失敗しました');
      }
    } //ネット接続用のエラー
    on SocketException {
      throw 'インターネットに接続されていません。接続状況を確認してください。';
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    // ビルドが終わった後に実行されるように予約する
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false, // ダイアログ外タップで閉じないようにする
        builder: (context) {
          return AlertDialog(
            title: const Text('エラー'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // ダイアログを閉じる
                  Navigator.of(context).pop(); // 前の画面（一覧など）に戻る
                },
                child: const Text('戻る'),
              ),
            ],
          );
        },
      );
    });
  }

  // 表示
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('天気詳細')),
      body: FutureBuilder<WeatherData>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loadingView();
          }
          if (snapshot.hasError) {
            showErrorDialog(context, snapshot.error.toString());
            return const SizedBox.shrink();
          }
          final weather = snapshot.data;
          if (weather == null) {
            return SizedBox.shrink();
          }

          return _weatherContent(weather);
        },
      ),
    );
  }

  Widget _weatherContent(WeatherData weather) {
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
  }

  Widget _loadingView() {
    return Stack(
      children: [
        const ModalBarrier(
          dismissible: false, // 壁をタップしても消えないようにする
          color: Colors.black12,
        ),
        const Center(
          child: CircularProgressIndicator(), // くるくる回るインジケーター
        ),
      ],
    );
  }
}
