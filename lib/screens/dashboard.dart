import 'package:ethics/model/data_model.dart';
import 'package:flutter/material.dart';

import '../apputils/consts.dart';
import '../resources/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<DataModel> dataList = <DataModel>[
    DataModel(pointerValue: 100, arrayValue: ArrayValue(under: 80, normal: 120, over: 190, obes: 300)),
    DataModel(pointerValue: 280, arrayValue: ArrayValue(under: 50, normal: 110, over: 210, obes: 300)),
    DataModel(pointerValue: 10, arrayValue: ArrayValue(under: 20, normal: 40, over: 60, obes: 80))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppPrimary,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(appName, style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: ListView.separated(
          separatorBuilder: (context, index){
            return Divider();
          },
            itemCount: dataList.length,
            itemBuilder: (context, index){
              return Row(
                children: [
                  RowItem(
                    color: Colors.blue,
                    text: 'Underweight',
                    minValue: 0,
                    maxValue: dataList[index].arrayValue.under,
                    pointerValue: dataList[index].pointerValue,
                  ),
                  const SizedBox(width: 2.0,),
                  RowItem(
                    color: Colors.green,
                    text: 'Normal',
                    minValue: dataList[index].arrayValue.under,
                    maxValue: dataList[index].arrayValue.normal,
                    pointerValue: dataList[index].pointerValue,
                  ),
                  const SizedBox(width: 2.0,),
                  RowItem(
                      color: Colors.yellow,
                      text: 'Overweight',
                      minValue: dataList[index].arrayValue.normal,
                      maxValue: dataList[index].arrayValue.over,
                      pointerValue: dataList[index].pointerValue),
                  const SizedBox(width: 2.0,),
                  RowItem(
                    color: Colors.redAccent,
                    text: 'Obesity',
                    minValue: dataList[index].arrayValue.over,
                    maxValue: dataList[index].arrayValue.obes,
                    pointerValue: dataList[index].pointerValue,),
                ],
              );
            }),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  Color color;
  String text;
  int maxValue;
  int minValue;
  int pointerValue;
  RowItem({required this.color, required this.text, required this.maxValue, required this.minValue, required this.pointerValue});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if(isInRange())
              Expanded(child: Icon(Icons.arrow_drop_down_outlined, color: color, size: 17.0,)),
            Text(maxValue.toString(), style: const TextStyle(fontSize: 13.0),)
          ],
        ),
        Container(
          height: 8.0,
          color: color),
        Text(text, style: const TextStyle(fontSize: 8.0),)
      ],
    ));
  }

  isInRange(){
    if(pointerValue>minValue && pointerValue<=maxValue){
      return true;
    }
    return false;
  }
}