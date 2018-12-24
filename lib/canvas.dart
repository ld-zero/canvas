import 'package:flutter/material.dart';
import 'model/drawing_config.dart';

class UserCanvas extends StatefulWidget {
  DrawingConfig _config = DrawingConfig();
  CanvasState _state = CanvasState();

  @override
  CanvasState createState() => _state;

  void updateDrawingConfig(DrawingConfig config) => _config = config;

  void cancelLine() => _state.cancelLine();

  void restoreLine() => _state.restoreLine();
}

class CanvasState extends State<UserCanvas> {
  List<Line> lines = List();
  List<Line> cancelLines = List();

  void cancelLine() {
    if (lines.length > 0) {
      cancelLines.add(lines.removeLast());
      setState(() {});
    }
  }

  void restoreLine() {
    if (cancelLines.length > 0) {
      lines.add(cancelLines.removeLast());
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Offset globalPositionToLocalPosition(Offset globalPosition) {
      RenderBox renderBox = context.findRenderObject();
      return renderBox.globalToLocal(globalPosition);
    }

    return GestureDetector(
      onPanStart: (dragStartDetails) {
        DrawingConfig config = widget._config;
        Line newLine = Line(config.strokeWidth);
        Offset localPosition =
            globalPositionToLocalPosition(dragStartDetails.globalPosition);
        newLine.path.moveTo(localPosition.dx, localPosition.dy);
        lines.add(newLine);
        cancelLines.clear();
        setState(() {});
      },
      onPanUpdate: (dragUpdateDetails) {
        Line line = lines[lines.length - 1];
        Offset localPosition =
            globalPositionToLocalPosition(dragUpdateDetails.globalPosition);
        line.path.lineTo(localPosition.dx, localPosition.dy);
        setState(() {});
      },
      child: CustomPaint(
          size: Size(double.infinity, double.infinity),
          painter: UserPainter(lines)),
    );
  }
}

class UserPainter extends CustomPainter {
  List<Line> lines;

  UserPainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height));
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..isAntiAlias = true;
    canvas.drawPaint(paint);
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black26;
    for (var line in lines) {
      paint.strokeWidth = line.width;
      canvas.drawPath(line.path, paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(UserPainter oldDelegate) => true;
}

class Line {
  Path path = Path();
  double width;

  Line(this.width);
}
