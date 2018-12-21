import 'package:flutter/material.dart';
import 'canvas.dart';

class DrawingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5DC),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Card(
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            color: Colors.white,
            child: UserCanvas(),
          )),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () {},
              elevation: 4,
              color: Colors.white,
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Open menu',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//class DrawingPanel extends StatefulWidget {
//  @override
//  DrawingPanelState createState() => DrawingPanelState();
//}
//
//class DrawingPanelState extends State<DrawingPanel> {
//  UserCanvas canvas = UserCanvas();
//
//  @override
//  Widget build(BuildContext context) {
//    List<Widget> widgets = List()
//      ..add(LayoutId(id: _Slot.canvas, child: canvas))
//      ..add(LayoutId(id: _Slot.strokeWidthBtn, child: StrokeWidthBtn()));
//
//    return CustomMultiChildLayout(
//      delegate: PanelDelegate(),
//      children: widgets,
//    );
//  }
//}
//
//class PanelDelegate extends MultiChildLayoutDelegate {
//  @override
//  void performLayout(Size size) {
//    Size strokeWidthBtnSize = Size.zero;
//    if (hasChild(_Slot.strokeWidthBtn)) {
//      Size layoutSize = Size(size.width, 50);
//      strokeWidthBtnSize =
//          layoutChild(_Slot.strokeWidthBtn, BoxConstraints.tight(layoutSize));
//      positionChild(
//          _Slot.strokeWidthBtn, Offset(0, size.height - layoutSize.height));
//    }
//    if (hasChild(_Slot.canvas)) {
//      Size layoutSize = Size(size.width, size.height - strokeWidthBtnSize.height);
//      layoutChild(_Slot.canvas, BoxConstraints.tight(layoutSize));
//      positionChild(_Slot.canvas, Offset.zero);
//    }
//  }
//
//  @override
//  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
//}
//
//class StrokeWidthBtn extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        GestureDetector(
//          onTap: () {
//            openStrokeWidthPanel();
//          },
//        ),
//        Card(
//          child: Center(
//            child: Column(
//              children: <Widget>[
//                CustomPaint(painter: CirclePainter()),
//                Text('Stroke width'),
//              ],
//            ),
//          ),
//        )
//      ],
//    );
//  }
//
//  void openStrokeWidthPanel() {}
//}
//
//class CirclePainter extends CustomPainter {
//  Color color;
//  double radius;
//
//  CirclePainter({this.color = Colors.black, this.radius = 1.5});
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    Paint paint = Paint()
//      ..isAntiAlias = true
//      ..style = PaintingStyle.fill
//      ..color = color;
//    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) => true;
//}
