

import 'package:flutter/material.dart';

class RankText extends StatelessWidget {

  const RankText({super.key, required this.rank, required this.colors});

  final int rank;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$rank',
      style: TextStyle(
        fontFamily: 'LuxuriousFont',
        fontSize: 40,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: colors,
          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
        shadows: [
          Shadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}
