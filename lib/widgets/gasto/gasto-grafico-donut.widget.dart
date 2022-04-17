import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

final linePaint = Paint()
  ..color = Colors.white
  ..strokeWidth = 2.0
  ..style = PaintingStyle.stroke;

final midPaint = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.fill;

class DonutChartPainter extends CustomPainter {
  final List<Dados> dataset;
  DonutChartPainter(this.dataset);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2.0, size.height / 2.0);
    final radius = size.width * 0.9;
    final rect = Rect.fromCenter(center: c, width: radius, height: radius);
    var startAngle = 0.0;

    dataset.forEach((di) {
      final sweepAngle = di.value * 360.0 * pi / 180.0;
      drawSelectors(canvas, di, rect, startAngle, sweepAngle);
      startAngle += sweepAngle;
    });
    dataset.forEach((di) {
      final sweepAngle = di.value * 360.0 * pi / 180.0;
      drawLine(canvas, c, radius, startAngle);
      startAngle += sweepAngle;
    });
    canvas.drawCircle(c, radius * 0.3, midPaint);
  }

  // TextPainter measureText(
  //     String s, TextStyle style, double maxWidth, TextAlign align) {
  //   final span = TextSpan(text: s, style: style);
  //   final tp = TextPainter(
  //       text: span, textAlign: align, textDirection: TextDirection.LTR);
  //   tp.layout(minWidth: 0, maxWidth: maxWidth);
  //   return tp;
  // }

  // Size drawTextCentered(Canvas canvas, Offset position, String text,
  //     TextStyle style, double maxWidth) {
  //   final tp = measureText(text, style, maxWidth, TextAlign.center);
  //   final pos = position + Offset(-tp.width / 2.0, -tp.height / 2.0);

  //   tp.paint(canvas, pos);
  //   return tp.size;
  // }
//13:24
  void drawLine(Canvas canvas, Offset c, double radius, double startAngle) {
    final dx = radius / 2.0 * cos(startAngle);
    final dy = radius / 2.0 * sin(startAngle);
    final p2 = c + Offset(dx, dy);
    canvas.drawLine(c, p2, linePaint);
  }

  void drawSelectors(Canvas canvas, Dados di, Rect rect, double startAngle,
      double sweepAngle) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = di.color;
    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
