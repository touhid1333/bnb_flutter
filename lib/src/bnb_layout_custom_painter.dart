part of '../bnb_flutter.dart';

class BNBCustomPainter extends CustomPainter {
  final Color backgroundColor;

  BNBCustomPainter(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final centerItemWidth = size.width * 0.20;
    final cutFromCenterWidth = centerItemWidth / 2;
    final canvasCenterPoint = size.width / 2;
    final leftPoint = canvasCenterPoint - cutFromCenterWidth;
    final rightPoint = canvasCenterPoint + cutFromCenterWidth;
    const borderRadius = 10.0;

    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.lineTo(leftPoint + (borderRadius / 2), size.height * 0.4);
    path.quadraticBezierTo(leftPoint, (size.height * 0.4 + (borderRadius / 2)),
        leftPoint + (borderRadius / 2), (size.height * 0.4 + borderRadius));
    path.lineTo(canvasCenterPoint - borderRadius, size.height * 0.8);
    path.quadraticBezierTo(canvasCenterPoint, size.height * 0.8 + borderRadius,
        canvasCenterPoint + borderRadius, size.height * 0.8);
    path.lineTo(
        (rightPoint - (borderRadius / 2)), (size.height * 0.4 + borderRadius));
    path.quadraticBezierTo(rightPoint, (size.height * 0.4 + (borderRadius / 2)),
        rightPoint - (borderRadius / 2), size.height * 0.4);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
