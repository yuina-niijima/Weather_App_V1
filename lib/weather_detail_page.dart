import 'package:flutter/material.dart';

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
