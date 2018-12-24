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
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => canvas.cancelLine()),
                Expanded(
                    child: MaterialButton(
                  onPressed: () => showCanvasMenu(context, config, (newConfig) {
                        config.strokeWidth = newConfig.strokeWidth;
                        canvas.updateDrawingConfig(config);
                      }),
                  elevation: 4,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Open menu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                )),
                IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () => canvas.restoreLine()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
