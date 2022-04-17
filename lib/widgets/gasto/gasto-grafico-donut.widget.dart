import 'dart:math';

import 'package:flutter/material.dart';

class Dados {
  final double value;
  final String label;
  final Color color;
  Dados(
    this.value,
    this.label,
    this.color,
  );
}

class GraficoDonutWidget extends StatefulWidget {
  final List<Dados> dataset;
  GraficoDonutWidget(this.dataset);

  @override
  _GraficoDonutWidgetState createState() => _GraficoDonutWidgetState();
}

class _GraficoDonutWidgetState extends State<GraficoDonutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomPaint(
      child: Container(),
      painter: DonutChartPainter(widget.dataset),
    ));
  }
}

class DonutChartPainter extends CustomPainter {
  final List<Dados> dataset;
  DonutChartPainter(this.dataset);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.9;
    final rect = Rect.fromCenter(center: c, width: radius, height: radius);

    var startAngle = 0.0;
    dataset.forEach((element) {
      final sweepAngle = element.value * 360.0 * pi / 180.0;
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = element.color;

      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
