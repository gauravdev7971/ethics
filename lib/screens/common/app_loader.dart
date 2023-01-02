import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 35,
          height: 35,
          child: Image.asset('assets/images/hex_loading.gif'),
        )
      ],
    );
  }
}
