
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/dimen.dart';
import '../../resources/styles.dart';

class PrimaryButton extends StatelessWidget {
  String buttonText; Function btnAction;

  PrimaryButton({required this.buttonText, required this.btnAction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){btnAction();},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: colorAppPrimary,
          borderRadius: BorderRadius.circular(5.0)
        ),
        padding: EdgeInsets.symmetric(vertical: height1_7),
        child: Text(buttonText, style: ro1_7AppWhite600, textAlign: TextAlign.center,),
      ),
    );
  }
}
