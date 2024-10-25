
import 'dart:convert';

import 'package:cloths_app/users/Api/api.dart';
import 'package:cloths_app/users/fragements/dashboard_of_fragements.dart';
import 'package:cloths_app/users/shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import 'package:cloths_app/users/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> LoginApi()async
  {
    try
    {

      final response = await http.post(Uri.parse(Api.url+"/login"),
          body: jsonEncode({
            'email': emailController.text.toString(),
            'password': passwordController.text.toString(),

          }),
          headers: {'Content-Type': 'application/json'});


      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());
        print(data);
        box.write('name', data['name']);
        box.write('email',data['email'] );
        print(box.read('name'));
        print(box.read('email'));



        if(data["message"]=="Login successful")
        {

          Get.to(()=>DashboardOfFragements());
        }
        else if(data["msg"=='Password do not match'])
          {
            print(' Wrong Password ');
          }
      }
      else
        {
          print("error");
        }
    }
    catch(e)
    {
      print(e.toString());
    }
  }
  var formkey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var isObscure= true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context,cons)
            {
              return ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: cons.maxHeight
                  ),
              child: SingleChildScrollView(
                  child: Column(
                  children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 285,
                        child: Image.asset("assets/images/cloth.webp"),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black26
                                ,
                              offset: Offset(0,-3)
                            )
                          ]

                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30.0,30,30,30),
                          child: Column(
                            children: [
                              Form(
                                key: formkey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        validator: (val)=> val== ""?"Write an email":null,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.email,color: Colors.black,),
                                          hintText: "Email",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60
                                            )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 6                                      ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      ),
                                     const SizedBox(height: 18),
                                      Obx(() => TextFormField(
                                        controller: passwordController,
                                        obscureText: isObscure.value,
                                        validator: (val)=> val== ""?"Enter Password Please":null,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.vpn_key_sharp,color: Colors.black,),
                                          suffixIcon: Obx(()=>
                                              GestureDetector(
                                                onTap: ()
                                                {
                                                  isObscure.value=!isObscure.value;
                                                },
                                                child: Icon(isObscure.value? Icons.visibility_off:Icons.visibility,color: Colors.black,),

                                              )),
                                          hintText: "Password",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: const BorderSide(
                                                  color: Colors.white60
                                              )
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 6                                      ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                      )),
                                      const SizedBox(height: 18),
                                      Material(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: ()
                                          {
                                             LoginApi();
                                               // Get.to(SignUpScreen());
                                          },
                                          borderRadius: BorderRadius.circular(30),
                                          child: const Padding(padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 28,
                                          ),
                                          child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16),),),
                                        ),
                                      ),


                                    ],
                                  ),
                              ),
                              SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an Account?"),
                                  TextButton(
                                      onPressed: ()
                                      {
                                        Get.to(SignUpScreen());
                                      },
                                      child: const Text("Register Here",style: TextStyle(color: Colors.purple,fontSize:15),)),

                                ],
                              ),
                              Text("Or",style: TextStyle(color: Colors.grey,fontSize: 16),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Are you an Admin?"),
                                  TextButton(
                                      onPressed: ()
                                      {

                                      },
                                      child: const Text("Click Here",style: TextStyle(color: Colors.purple,fontSize: 16),)),

                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                    )
                ],
              ),
              ),);
            }
      ),
    );
  }
}
