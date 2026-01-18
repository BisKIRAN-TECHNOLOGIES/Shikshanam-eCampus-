import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const AppBackground({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0b1024),
                  Color(0xFF0f162c),
                  Color(0xFF151b30),
                  Color(0xFF1a0f3a),
                ],
                stops: [0.0, 0.38, 0.68, 1.0],
              )
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xFFF8FAFC),
                  Color(0xFFF1F5F9),
                  Colors.white,
                ],
                stops: [0.0, 0.38, 0.68, 1.0],
              ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -140,
            right: -80,
            child: _GlowCircle(
              color: isDark
                  ? const Color(0xFF4f46e5).withOpacity(0.25)
                  : const Color(0xFF4f46e5).withOpacity(0.08),
              size: 260,
            ),
          ),
          Positioned(
            bottom: -160,
            left: -90,
            child: _GlowCircle(
              color: isDark
                  ? const Color(0xFF1e40af).withOpacity(0.22)
                  : const Color(0xFF1e40af).withOpacity(0.06),
              size: 300,
            ),
          ),
          Positioned.fill(
            child: padding != null
                ? Padding(padding: padding!, child: child)
                : child,
          ),
        ],
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowCircle({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }
}
