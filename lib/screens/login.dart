import 'package:ethics/network/network_services.dart';
import 'package:flutter/material.dart';

import '../apputils/consts.dart';
import '../apputils/routes.dart';
import '../apputils/utility.dart';
import '../resources/dimen.dart';
import '../resources/styles.dart';
import 'common/primary_button.dart';
import 'common/primary_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController unController = TextEditingController();
  TextEditingController pwController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryInput(
              hintText: 'Enter User Name',
              labelText: 'User Name',
              controller: unController,
              inputType: TextInputType.emailAddress,
              suffixText: '*',
              maxLength: 30,
            ),
            SizedBox(height: height4_6,),
            PrimaryInput(
              hintText: 'Enter Password',
              labelText: 'Password',
              controller: pwController,
              inputType: TextInputType.text,
              suffixText: '*',
              maxLength: 7,),
            SizedBox(height: height4_6,),
            PrimaryButton(buttonText: 'Login', btnAction: (){loginAction();}),
            SizedBox(height: height4_6,),
          ],
        ),
      ),
    );
  }

  @override
  dispose(){
    unController.dispose();
    pwController.dispose();
    super.dispose();
  }

  loginAction() async{
    bool isConnected = await isNetworkConnected();

    if (unController.text.isEmpty) {
      showMessage(context, errorEmptyUserName);
      return;
    }
    if (pwController.text.isEmpty) {
      showMessage(context, errorEmptyPassword);
      return;
    }
    if (!isConnected) {
      showMessage(context, errorInternet);
      return;
    }



    Map<String, dynamic> loginParam = {};
    loginParam['db'] = 'Warehouse-Zota-10-11';
    loginParam['login'] = unController.text;
    loginParam['password'] = pwController.text;

    Map<String, dynamic> requestBody = {};
    requestBody['jsonrpc'] = '2.0';
    requestBody['method'] = 'call';
    requestBody['params'] = loginParam;

    showLoader(context);
    var response = await NetworkServices.createRequestLogin(requestBody);
    Navigator.pop(context);

    if(response.containsKey('result')){
      navigateScreen(context: context, path: Routes.dashboard, isReplace: false, args: {});
    }
    else{
      showMessage(context, 'Login Failed! Invalid Credentials');
    }
  }
}