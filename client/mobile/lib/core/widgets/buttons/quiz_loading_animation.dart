import 'dart:math';
import 'package:flutter/material.dart';

class QuizLoadingIndicator extends StatefulWidget {
  const QuizLoadingIndicator({super.key});

  @override
  QuizLoadingIndicatorState createState() => QuizLoadingIndicatorState();
}

class QuizLoadingIndicatorState extends State<QuizLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: QuizLoadingPainter(_animation.value),
                size: const Size(120, 120),
              );
            },
          ),
          const Text(
            'クイズ生成中...',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class QuizLoadingPainter extends CustomPainter {

  QuizLoadingPainter(this.angle);
  final double angle;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.8,
      height: size.height * 0.8,
    );

    final gradient = SweepGradient(
      startAngle: angle,
      endAngle: angle + pi / 2,
      colors: const [
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.orange,
        Colors.red,
        Colors.purple,
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawArc(rect, angle, pi / 2, false, paint);
  }

  @override
  bool shouldRepaint(QuizLoadingPainter oldDelegate) => angle != oldDelegate.angle;
}
