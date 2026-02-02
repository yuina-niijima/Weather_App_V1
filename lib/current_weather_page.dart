import 'package:flutter/material.dart';

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
