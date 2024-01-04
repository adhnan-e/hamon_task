import 'package:flutter/material.dart';

class CurveScreenPainter extends CustomPainter {
  var strokeWidth = 8.0;
  var offset = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth;

    var path = Path();
    path.moveTo(offset, size.height - offset);
    path.quadraticBezierTo(size.width / 2, -size.height + offset,
        size.width - offset, size.height - offset);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
