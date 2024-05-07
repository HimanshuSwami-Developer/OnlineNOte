import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongopro/base_client.dart';
import 'package:mongopro/controller.dart';
import 'package:mongopro/modals/registermodal.dart';
import 'package:mongopro/view/notesadd.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameText=new TextEditingController();
  TextEditingController emailText=new TextEditingController();
  TextEditingController passwordText=new TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*0.9,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Register ....",style: TextStyle(fontSize: 30),),
              SizedBox(
                height: 15,
              ),
              Container(
                child: TextField(
                  controller: nameText,
                  decoration: InputDecoration(hintText: "enter the username "),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(controller: emailText,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "enter the Email "),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: passwordText,
                 
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(hintText: "enter the password "),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: ()async{
                var user=RegisterModal(
                  name: nameText.text.toString(),
                  email: emailText.text.toString(),
                  password: passwordText.text.toString()
                );
                var response=await BaseClient().post('/createUser',user).catchError((err){print(err);});
                if(response==null)return;
                Get.offAll(Notes());
                debugPrint("success");

              }, child: Text("Submit")),
              
              SizedBox(
                height: 10,
              ),
              ListTile(title: Text("Login?"),onTap: () {
                Get.to(Login());
              },)
            ],
          ),
        ),
      ),
    );
  }
}


class Login extends StatefulWidget {
  String? authText;
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailText=new TextEditingController();
  TextEditingController passwordText=new TextEditingController();
TextEditingController authcontroller=new TextEditingController();

  // String? authText;
  // AuthController controller=Get.put(AuthController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*0.9,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login ....",style: TextStyle(fontSize: 30),),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: TextField(controller: emailText,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "enter the Email "),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextField(
                      controller: passwordText,
                     
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(hintText: "enter the password "),
                    ),
                  ),
          
                  SizedBox(
                    height: 10,
                  ),
                  
                  ElevatedButton(onPressed: ()async{
                        var jsonResponse;
                        var user=LoginModal(
                          email: emailText.text.toString(),
                          password: passwordText.text.toString()
                        );
                        var response=await BaseClient().post('/login',user).catchError((err){});
                            jsonResponse= json.decode(response);
                            if (jsonResponse!=null) {
                             
                             debugPrint("success");   
                             debugPrint(jsonResponse["authToken"]);   
                              setState(() {
                                String authText=jsonResponse["authToken"].toString();
                                // authcontroller=jsonResponse["authToken"] as TextEditingController;

                              Get.offAll(Notes(),arguments: authText);
                              });
                            }
                  
                      }, child: Text("Submit")),
                  
                  
                ],
              
            
          ),
        ),
      ),
    );
  }
}
