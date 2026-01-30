import 'package:flutter/material.dart';
import 'package:weather_app_v1/main.dart';
import 'package:weather_app_v1/prefectures.dart';

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
