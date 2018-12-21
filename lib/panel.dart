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
              onPressed: () => openMenu(),
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

  void openMenu() {}
}