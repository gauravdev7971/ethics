import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'apputils/consts.dart';
import 'apputils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(Ethics());
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class Ethics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType){
          return MaterialApp(
            title: appName,
            navigatorKey: mainNavigatorKey,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: Routes.generateRoute,
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}
