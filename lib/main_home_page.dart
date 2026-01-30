import 'package:flutter/material.dart';
import 'package:weather_app_v1/current_weather_page.dart';
import 'package:weather_app_v1/select_city_page.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('お天気アプリ'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        // 画面全体の余白を Padding ウィジェットで設定
        body: Padding(
          padding: const EdgeInsets.all(24.0), // 上下左右の余白
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // 横いっぱいに表示
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/MainWeather.png', height: 200),
              const SizedBox(height: 50),
              //paddingで全体の余白設定
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0), // 下だけに16の余白
                child: ElevatedButton(
                  onPressed: () {
                    // 画面遷移
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectCityPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20, // 上下（垂直方向）に 20 ピクセル分の余白を作る
                    ), // ボタン内の厚み
                  ),
                  child: const Text(
                    '都道府県を選択',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold, // 太字
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  // 画面遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CurrentWeatherPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                child: const Text(
                  '現在地の天気予報を見る',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
