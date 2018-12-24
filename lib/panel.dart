import 'package:flutter/material.dart';
import 'canvas.dart';
import 'model/drawing_config.dart';
import 'bottom_menu.dart';

class DrawingPanel extends StatelessWidget {
  DrawingConfig config = DrawingConfig();
  UserCanvas canvas = UserCanvas();

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
            child: canvas,
          )),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              onPressed: () => showCanvasMenu(context, config, (newConfig) {
                    config.strokeWidth = newConfig.strokeWidth;
                    canvas.updateDrawingConfig(config);
                  }),
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
