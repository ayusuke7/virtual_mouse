import 'package:flutter/material.dart';

class CursorPainter extends CustomPainter {
  final Color color;
  final double angle;

  CursorPainter({
    required this.color,
    required this.angle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.save();
    final radians = angle * (3.141592653589793 / 180);
    canvas.rotate(radians);

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(10, 20)
      ..lineTo(0, 15)
      ..lineTo(-10, 20)
      ..close();

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
