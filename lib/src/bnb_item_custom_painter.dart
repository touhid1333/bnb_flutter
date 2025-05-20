part of '../bnb_flutter.dart';

class BNBCenterCustomPainter extends CustomPainter {
  final Color backgroundColor;

  BNBCenterCustomPainter(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final centerWidth = size.width / 2;
    final centerHeight = size.height / 2;
    const borderRadius = 10.0;

    Path path = Path();
    path.moveTo(borderRadius / 2, centerHeight - (borderRadius / 2));
    path.quadraticBezierTo(
        0, centerHeight, borderRadius / 2, centerHeight + (borderRadius / 2));
    path.lineTo(
        centerWidth - (borderRadius / 2), (size.height - borderRadius / 2));
    path.quadraticBezierTo(centerWidth, size.height,
        centerWidth + (borderRadius / 2), (size.height - borderRadius / 2));
    path.lineTo(
        size.width - (borderRadius / 2), centerHeight + borderRadius / 2);
    path.quadraticBezierTo(size.width, centerHeight,
        size.width - (borderRadius / 2), centerHeight - borderRadius / 2);
    path.lineTo(centerWidth + borderRadius / 2, borderRadius / 2);
    path.quadraticBezierTo(
        centerWidth, 0, centerWidth - borderRadius / 2, borderRadius / 2);
    path.lineTo(borderRadius / 2, centerHeight - borderRadius / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
