import 'package:flutter/material.dart';

class UserCanvas extends StatefulWidget {
  @override
  CanvasState createState() => CanvasState();
}

class CanvasState extends State<UserCanvas> {
  List<Line> lines = List();

  @override
  Widget build(BuildContext context) {
    Offset globalPositionToLocalPosition(Offset globalPosition) {
      RenderBox renderBox = context.findRenderObject();
      return renderBox.globalToLocal(globalPosition);
    }

    return Stack(
      children: <Widget>[
        GestureDetector(
          onPanStart: (dragStartDetails) {
            Line newLine = Line();
            Offset localPosition =
                globalPositionToLocalPosition(dragStartDetails.globalPosition);
            newLine.path.moveTo(localPosition.dx, localPosition.dy);
            lines.add(newLine);
            setState(() {});
          },
          onPanUpdate: (dragUpdateDetails) {
            Line line = lines[lines.length - 1];
            Offset localPosition =
                globalPositionToLocalPosition(dragUpdateDetails.globalPosition);
            line.path.lineTo(localPosition.dx, localPosition.dy);
            setState(() {});
          },
        ),
        CustomPaint(painter: UserPainter(lines)),
      ],
    );
  }
}

class UserPainter extends CustomPainter {
  List<Line> lines;
  bool hasNewPoints = false;

  Paint userPaint = Paint()
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3
    ..color = Colors.black26
    ..isAntiAlias = true;

  UserPainter(this.lines) {
    hasNewPoints = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in lines) {
      canvas.drawPath(line.path, userPaint);
    }
    hasNewPoints = false;
  }

  @override
  bool shouldRepaint(UserPainter oldDelegate) => hasNewPoints;
}

class Line {
  Path path = Path();
}
