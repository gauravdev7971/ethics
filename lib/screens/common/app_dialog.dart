
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';


class AppDialog extends StatelessWidget{
  final String b1Text, b2Text, title, description;
  final VoidCallback b1Action, b2Action;

  AppDialog(this.title, this.description, this.b1Text, this.b2Text, this.b1Action, this.b2Action);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.black),),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Expanded(child: Align(alignment: Alignment.center, child: Text(description, style: const TextStyle(fontSize: 14), textAlign: TextAlign.center,)))],),
          ),
          const SizedBox(height: 25,),
          Padding(padding: const EdgeInsets.all(7.0), child: Row(
            children: [
              if(b1Text!='0')
                Expanded(child: InkWell(onTap: b1Action, child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.4, color: colorAppPrimary),
                        borderRadius: BorderRadius.circular(18),)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(b1Text, style: TextStyle(color: colorAppPrimary),)],
                  ),),)),
              const SizedBox(width: 3.0,),
              Expanded(child: InkWell(onTap: b2Action, child: Container(
                decoration: ShapeDecoration(
                    color: colorAppPrimary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),)
                ),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(b2Text, style: const TextStyle(color: Colors.white),)],
                ),),)),
            ],
          ),),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

}