
import 'package:flutter/material.dart';

class TransparentCard extends StatelessWidget {
  const TransparentCard({
    super.key,
    required this.child,
    this.opacity = 0.35,
    this.borderRadius = 15,
  });

  final Widget child;
  final double opacity;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(opacity),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
    );
  }
}
