import 'package:flutter/material.dart';
import 'package:weather_app_v1/prefectures.dart';
import 'package:weather_app_v1/weather_detail_page.dart';

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
