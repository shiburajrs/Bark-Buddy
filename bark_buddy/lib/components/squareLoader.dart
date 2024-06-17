import 'package:flutter/material.dart';

class SequentialSquaresLoader extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;

  SequentialSquaresLoader({
    this.size = 50.0,
    this.color = Colors.white,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _SequentialSquaresLoaderState createState() => _SequentialSquaresLoaderState();
}

class _SequentialSquaresLoaderState extends State<SequentialSquaresLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();


    _animations = List.generate(4, (index) {
      double start = index / 4;
      double end = start + 0.25;

      return TweenSequence<double>([
        TweenSequenceItem(tween: Tween(begin: 0.5, end: 1.5), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 1.5, end: 0.5), weight: 1),
      ]).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * 2,
      height: widget.size,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) => _buildAnimatedSquare(_animations[index])),
        ),
      ),
    );
  }

  Widget _buildAnimatedSquare(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          child: Container(
            width: widget.size / 6,
            height: widget.size / 6,
            color: widget.color,
          ),
        );
      },
    );
  }
}