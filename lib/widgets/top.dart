import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/headTop.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
