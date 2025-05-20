part of '../bnb_flutter.dart';

class BNBCustomPainter extends CustomPainter {
  final double index;
  final int totalItem;
  final Color backgroundColor;

  BNBCustomPainter(this.backgroundColor, this.index, this.totalItem);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final itemTotalWidth = size.width / totalItem;
    final itemTotalWidthCenter = itemTotalWidth / 2;
    final itemWidth = size.width * 0.18;
    final itemWidthCenter = itemWidth / 2;
    final startPoint =
        (itemTotalWidth * (index + 1)) - itemTotalWidthCenter - itemWidthCenter;
    final endPoint =
        (itemTotalWidth * (index + 1)) - itemTotalWidthCenter + itemWidthCenter;
    final centerPoint = (itemTotalWidth * (index + 1)) - itemTotalWidthCenter;
    const borderRadius = 10.0;

    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.lineTo(startPoint + (borderRadius / 2), size.height * 0.4);
    path.quadraticBezierTo(startPoint, (size.height * 0.4 + (borderRadius / 2)),
        startPoint + (borderRadius / 2), (size.height * 0.4 + borderRadius));
    path.lineTo(centerPoint - borderRadius, size.height * 0.8);
    path.quadraticBezierTo(centerPoint, size.height * 0.8 + borderRadius,
        centerPoint + borderRadius, size.height * 0.8);
    path.lineTo(
        (endPoint - (borderRadius / 2)), (size.height * 0.4 + borderRadius));
    path.quadraticBezierTo(endPoint, (size.height * 0.4 + (borderRadius / 2)),
        endPoint - (borderRadius / 2), size.height * 0.4);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
