import 'dart:math';
import 'package:flutter/material.dart';


class RainbowCircularProgressIndicator extends StatefulWidget {

  const RainbowCircularProgressIndicator({
    super.key,
    this.size = 50.0,
    this.strokeWidth = 5.0,
  });
  final double size;
  final double strokeWidth;

  @override
  RainbowCircularProgressIndicatorState createState() =>
      RainbowCircularProgressIndicatorState();
}

class RainbowCircularProgressIndicatorState
    extends State<RainbowCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: RainbowCircularProgressPainter(
            progress: _animation.value,
            strokeWidth: widget.strokeWidth,
          ),
        );
      },
    );
  }
}

class RainbowCircularProgressPainter extends CustomPainter {

  RainbowCircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
  });
  final double progress;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const gradient = SweepGradient(
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
        Colors.red,
      ],
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    const startAngle = -pi / 2;
    final sweepAngle = pi * 2 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(RainbowCircularProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

