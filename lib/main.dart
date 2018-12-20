import 'package:flutter/material.dart';
import 'Canvas.dart';

void main() => runApp(MaterialApp(
      home: CanvasApp(),
    ));

class CanvasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: UserCanvas(),
      );
}
