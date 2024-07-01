
import 'dart:async';

import 'package:flutter/material.dart';


class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});
  @override
  CountdownScreenState createState() => CountdownScreenState();
}

class CountdownScreenState extends State<CountdownScreen> with SingleTickerProviderStateMixin {
  int _countdown = 3;
  Timer? _timer;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  final List<Color> _pastelColors = [
    const Color(0xFFFFB3BA), // パステルピンク
    const Color(0xFFFFDFBA), // パステルオレンジ
    const Color(0xFFFFFFBA), // パステルイエロー
    const Color(0xFFBAFFBA), // パステルグリーン
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _colorAnimation = ColorTween(begin: _pastelColors[0], end: _pastelColors[1]).animate(_controller);
    startTimer();
  }

  void startTimer() {
    _countdown = 3;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
          _colorAnimation = ColorTween(
            begin: _pastelColors[3 - _countdown],
            end: _pastelColors[3 - _countdown + 1],
          ).animate(_controller);
          _controller.forward(from: 0);
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _colorAnimation.value,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_countdown',
                  style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
