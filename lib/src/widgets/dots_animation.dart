import 'package:flutter/material.dart';

/// A widget that displays an animated sequence of dots.
class DotsAnimation extends StatefulWidget {
  /// The size of each dot.
  final double dotSize;

  /// The color of the dots.
  final Color color;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a new [DotsAnimation] widget.
  const DotsAnimation({
    super.key,
    this.dotSize = 12.0,
    required this.color,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<DotsAnimation> createState() => _DotsAnimationState();
}

class _DotsAnimationState extends State<DotsAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.dotSize * 2,
      width: widget.dotSize * 6,
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _DotsPainter(
                animationValue: _controller.value,
                dotSize: widget.dotSize,
                color: widget.color,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A custom painter that draws the animated dots.
class _DotsPainter extends CustomPainter {
  /// The current value of the animation.
  final double animationValue;

  /// The size of each dot.
  final double dotSize;

  /// The color of the dots.
  final Color color;

  /// Creates a new [_DotsPainter] instance.
  _DotsPainter({
    required this.animationValue,
    required this.dotSize,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final double spacing = dotSize * 1.5;
    final double baseY = size.height / 2;
    final double amplitude = dotSize / 2;

    for (int i = 0; i < 3; i++) {
      final double offsetX = i * spacing + (size.width - 2 * spacing) / 2;
      final double progress = (animationValue + i * 0.2) % 1.0;
      final double offsetY = baseY - amplitude * (1 - (progress * 2 - 1).abs());
      canvas.drawCircle(
        Offset(offsetX, offsetY),
        dotSize / 2,
        paint
          ..color = color.withAlpha(
            (0.3 + 0.7 * (1 - (progress * 2 - 1).abs()) * 255).toInt(),
          ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DotsPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.dotSize != dotSize ||
        oldDelegate.color != color;
  }
}
