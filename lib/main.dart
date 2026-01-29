import 'package:flutter/material.dart';
//スプラッシュ画面
import 'package:flutter_native_splash/flutter_native_splash.dart';

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

  // メイン画面
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //ヘッダー
        appBar: AppBar(
          title: const Text('お天気アプリ'), // 表示する文字
          centerTitle: true, // 中央寄せ
          backgroundColor: Colors.blue, // 背景色を青に
          foregroundColor: Colors.white, //文字色白に
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            // 画像を表示
            Image.asset(
              'assets/MainWeather.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text('Hello World!'),
            ),
          ],
        ),
      ),
    );
  }
}
