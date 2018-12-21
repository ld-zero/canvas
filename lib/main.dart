import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'panel.dart';

void main() => runApp(MaterialApp(
      home: CanvasApp(),
    ));

class CanvasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: DrawingPanel(),
    );
  }
}
