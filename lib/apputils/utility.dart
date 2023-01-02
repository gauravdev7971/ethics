import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import '../screens/common/app_dialog.dart';
import '../screens/common/app_loader.dart';

printLog(String msg){
  debugPrint(msg);
}

Future<bool> isNetworkConnected() async{
var connectivityResult = await (Connectivity().checkConnectivity());
return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
}

showMessage(context, message){
  showToast(
      message,
      context: context,
      backgroundColor: Colors.red,
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white),
      duration: const Duration(seconds: 3),
      position: StyledToastPosition.top);
}

showLoader(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return AppLoader();
  });
}

showActionDialog({
  required BuildContext context,
  required String subject,
  required String message,
  required String negativeText,
  required String positiveText,
  required Function positiveAction,
  required Function negativeAction}) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AppDialog(subject, message, negativeText, positiveText, () {
          Navigator.pop(context);
          negativeAction();
        }, () {
          Navigator.pop(context);
          positiveAction();
        });
      });
}

Future<void> navigateScreen({required BuildContext context, required String path, required bool isReplace, required Map<String, dynamic> args}) async {
  if(isReplace){
    Navigator.pushReplacementNamed(context, path, arguments: args).then((value) {return;} );
  }
  else{
    Navigator.pushNamed(context, path, arguments: args).then((value) {return;} );
  }

}