import 'package:flutter/material.dart';
import 'package:project2/model/submit_info.dart';
import 'package:project2/theme/colors.dart';
import 'dart:ui' as ui;

class CustomCanvas extends StatefulWidget {
  const CustomCanvas({
    super.key,
    required this.size,
    required this.info,
    this.child,
  });

  final Size size;
  final Widget? child;
  final SubmitInfo info;

  @override
  State<CustomCanvas> createState() => CustomCanvasState();
}

class CustomCanvasState extends State<CustomCanvas> {
  List<Offset> points = [];

  Future<void> handleSavePressed() async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    var painter = _DrawingPainter(points);
    var size = widget.size;

    Paint whitePaint = Paint()..color = Colors.white;
    canvas.drawPaint(whitePaint);

    painter.paint(canvas, size);
    ui.Image renderedImage = await recorder
        .endRecording()
        .toImage(size.width.floor(), size.height.floor());

    var pngBytes =
        await renderedImage.toByteData(format: ui.ImageByteFormat.png);

    widget.info.drawImages.add(pngBytes!.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.child != null)
          Container(
            width: widget.size.width,
            height: widget.size.height,
            color: Colors.white,
            child: widget.child!,
          ),
        GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              RenderBox renderBox = context.findRenderObject() as RenderBox;
              points.add(renderBox.globalToLocal(details.globalPosition));
            });
          },
          onPanEnd: (details) {
            setState(() {
              points.add(Offset.zero);
            });
          },
          child: RepaintBoundary(
            child: ClipRect(
              child: Container(
                width: widget.size.width,
                height: widget.size.height,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorStyles.grey0,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CustomPaint(
                  painter: _DrawingPainter(points),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<Offset> points;

  _DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    Rect clipRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.clipRect(clipRect);

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      } else if (points[i] != Offset.zero && points[i + 1] == Offset.zero) {
        canvas.drawPoints(ui.PointMode.points, [points[i]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
