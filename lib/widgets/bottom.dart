import 'package:flutter/material.dart';

class BottomImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/headbottom.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
