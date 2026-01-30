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

  // 読みやすくするためにメイン画面を別クラスに分ける
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainHomePage(),
    );
  }
}

// メイン画面のクラス
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

// 都道府県選択画面
class SelectCityPage extends StatelessWidget {
  const SelectCityPage({super.key});

  // 都道府県のリストデータ
  final List<String> prefectures = const [
    '北海道',
    '青森県',
    '岩手県',
    '宮城県',
    '秋田県',
    '山形県',
    '福島県',
    '茨城県',
    '栃木県',
    '群馬県',
    '埼玉県',
    '千葉県',
    '東京都',
    '神奈川県',
    '新潟県',
    '富山県',
    '石川県',
    '福井県',
    '山梨県',
    '長野県',
    '岐阜県',
    '静岡県',
    '愛知県',
    '三重県',
    '滋賀県',
    '京都府',
    '大阪府',
    '兵庫県',
    '奈良県',
    '和歌山県',
    '鳥取県',
    '島根県',
    '岡山県',
    '広島県',
    '山口県',
    '徳島県',
    '香川県',
    '愛媛県',
    '高知県',
    '福岡県',
    '佐賀県',
    '長崎県',
    '熊本県',
    '大分県',
    '宮崎県',
    '鹿児島県',
    '沖縄県',
  ];
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
            child: ElevatedButton(
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
                      cityName: prefectures[index],
                    ),
                    fullscreenDialog: true, // true だとモーダル遷移になる
                  ),
                );
              },
              child: Text(
                prefectures[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WeatherDetailPage extends StatelessWidget {
  final String cityName;

  const WeatherDetailPage({
    super.key,
    required this.cityName,
  });

  // モーダル画面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Text(cityName),
      ),
    );
  }
}

// 現在地の天気画面
class CurrentWeatherPage extends StatelessWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('現在地の天気')),
      body: const Center(
        child: Text('天気を表示', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
