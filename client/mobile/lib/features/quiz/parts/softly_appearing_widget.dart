

import 'package:flutter/material.dart';

class SoftlyAppearingWidget extends StatefulWidget {

  const SoftlyAppearingWidget({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
  });
  final Widget child;
  final Duration duration;

  @override
  SoftlyAppearingWidgetState createState() => SoftlyAppearingWidgetState();
}

class SoftlyAppearingWidgetState extends State<SoftlyAppearingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
