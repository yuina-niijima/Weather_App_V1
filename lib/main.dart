import 'package:flutter/material.dart';
//スプラッシュ画面
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_app_v1/main_home_page.dart';
import 'package:weather_app_v1/prefectures.dart';
import 'package:weather_app_v1/weather_detail_page.dart';

void main() {
  // バインディングの初期化(定型文)
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // スプラッシュ画面が自動で消えないようにする
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

// 土台
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 中身
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _dismissSplashScreen(); // ここでスプラッシュを制御する関数を呼ぶ
  }

  // スプラッシュ関数をいつ消すかの関数
  void _dismissSplashScreen() async {
    // ここで「2秒間」待機
    await Future.delayed(const Duration(seconds: 2));

    // 2秒経ったらスプラッシュを消して、アプリ画面を表示する
    FlutterNativeSplash.remove();
  }

  // 読みやすくするためにメイン画面を別クラスに分ける
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainHomePage(),
    );
  }
}

// 都道府県選択画面
class SelectCityPage extends StatelessWidget {
  const SelectCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('都道府県を選択')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0), // 上下左右に余白
        itemCount: prefectures.length, // prefecturesの数を数える
        // 一個ずつのボタンの設定
        itemBuilder: (context, index) {
          return Padding(
            // ボタンとボタンの間の隙間padding
            padding: const EdgeInsets.only(
              bottom: 12.0,
            ), // ボタンの枠と、中の文字の間に隙間を空けるためpadding
            child: ListCell(
              prefecture: prefectures[index],
            ),
          );
        },
      ),
    );
  }
}

class ListCell extends StatelessWidget {
  const ListCell({
    super.key,
    required this.prefecture,
  });

  final String prefecture;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        // 文字色
        foregroundColor: const Color.fromARGB(255, 5, 40, 57),
        elevation: 5, // 影の深さ
        shadowColor: Colors.indigo, // 影の色
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WeatherDetailPage(
              cityName: prefecture,
            ),
            fullscreenDialog: true, // true だとモーダル遷移になる
          ),
        );
      },
      child: Text(
        prefecture,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
