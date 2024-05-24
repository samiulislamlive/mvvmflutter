
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvmflutter/utils/utils.dart';
import 'package:mvvmflutter/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../resource/components/round_button.dart';
import '../utils/route/routes_name.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  ValueNotifier<bool> _obscurePass = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
    emailFocus.dispose();
    passFocus.dispose();
    _obscurePass.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authViewMode = Provider.of<AuthViewMode>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400)
                ),
                child: TextFormField(
                  focusNode: emailFocus,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                      border: InputBorder.none,
                    prefixIcon: Icon(Icons.alternate_email,
                    color: Colors.blue,
                    )
                  ),
                  onFieldSubmitted: (value){
                    Utils.fieldFocusChange(context, emailFocus, passFocus);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade400)
                ),
                child: ValueListenableBuilder(valueListenable: _obscurePass, builder: (context,value,child)
                {
                  return TextFormField(
                    focusNode: passFocus,
                    controller: passController,
                    obscureText: _obscurePass.value,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock,
                          color: Colors.blue,
                        ),
                      suffixIcon: InkWell(
                        onTap: (){
                          _obscurePass.value = !_obscurePass.value;
                        },
                        child: Icon(_obscurePass.value?Icons.visibility_off:Icons.visibility),
                      )
                    ),
                  );
                })
              ),
              SizedBox(height: 10,),
              RoundButton(title: 'Login',
                loading: authViewMode.loading,
                onPress: () {
                if(emailController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Email", context, Colors.red, Icon(Icons.error));
                }
                else if(passController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please Enter Password", context, Colors.red, Icon(Icons.error));
                }
                else if(passController.text.length < 6){
                  Utils.flushBarErrorMessage("Please Enter 6 digit password", context, Colors.red, Icon(Icons.error));
                }
                else{
                  Utils.toastMessage("Very Good");
                  print("Api has been hit");
                  Map data = {
                    "email": emailController.text.toString(),
                    "password": passController.text.toString()
                  };
                  authViewMode.loginApi(data, context);
                  Navigator.pushNamed(context, RoutesName.home);
                }
                },)
              // Text("This is login screen"),
              // SizedBox(height: 30,),
              // InkWell(
              //     onTap: (){
              //       Navigator.pushNamed(context, RoutesName.home);
              //       Utils.toastMessage("Login Successful");
              //     },
              //     child: Text("Click"))
            ],
          ),
        ),
      ),
    );
  }
}
