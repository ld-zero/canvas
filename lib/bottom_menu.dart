import 'package:flutter/material.dart';
import 'circles.dart';
import 'model/drawing_config.dart';

typedef OnConfigUpdate = void Function(DrawingConfig config);

void showCanvasMenu(BuildContext context, DrawingConfig config,
    OnConfigUpdate configUpdateCallback) {
  showModalBottomSheet(
      context: context,
      builder: (context) => CanvasMenu(config, configUpdateCallback));
}

class CanvasMenu extends StatelessWidget {
  DrawingConfig config;
  OnConfigUpdate configUpdateCallback;

  CanvasMenu(this.config, this.configUpdateCallback);

  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(10),
        children: <Widget>[StrokeWidthItem(config, configUpdateCallback)],
      );
}

class StrokeWidthItem extends StatelessWidget {
  DrawingConfig config;
  OnConfigUpdate configUpdateCallback;

  StrokeWidthItem(this.config, this.configUpdateCallback);

  @override
  Widget build(BuildContext context) => buildMenuItemView(
          Color(0xFF6495ED),
          Text(
            'Width',
            style: TextStyle(color: Colors.white),
          ), () {
        Navigator.pop(context);
        openStrokeWidthMenu(context);
      });

  void openStrokeWidthMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 100,
            child: StrokeWidthMenu(config, configUpdateCallback),
          );
        });
  }
}

class StrokeWidthMenu extends StatefulWidget {
  DrawingConfig config;
  OnConfigUpdate configUpdateCallback;

  StrokeWidthMenu(this.config, this.configUpdateCallback);

  @override
  StrokeWidthMenuState createState() => StrokeWidthMenuState();
}

class StrokeWidthMenuState extends State<StrokeWidthMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: ColorCircle(Colors.black, widget.config.strokeWidth / 2),
          ),
        ),
        Container(
          height: 50,
          child: Slider(
              value: widget.config.strokeWidth,
              max: widget.config.maxStrokeWidth,
              onChanged: (value) {
                widget.config.strokeWidth = value;
                setState(() {});
              },
              onChangeEnd: (value) =>
                  widget.configUpdateCallback(widget.config)),
        )
      ],
    );
  }
}

Widget buildMenuItemView(
        Color bgColor, Widget content, GestureTapCallback callback) =>
    GestureDetector(
      onTap: callback,
      child: Card(
        elevation: 0,
        color: bgColor,
        child: Center(child: content),
      ),
    );
