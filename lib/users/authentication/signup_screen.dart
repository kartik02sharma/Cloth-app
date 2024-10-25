

import 'dart:convert';

import 'package:cloths_app/users/Api/api.dart';
import 'package:cloths_app/users/authentication/login_screen.dart';
import 'package:cloths_app/users/authentication/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formkey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var isObscure= true.obs;
  Future<void> signupApi()async
  {
    try {
      var response = await http.post(
          Uri.parse(Api.url+"/signup"),
          body: jsonEncode({
            'name': nameController.text.toString(),
            'email': emailController.text.toString(),
            'password': passwordController.text.toString(),

          }),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        print(response.statusCode);
        var data = json.decode(response.body.toString());
        Get.snackbar(data.toString(), "");
      }
    }
    catch(e)
    {
      print(e.toString());
    }

  }
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
                      child: Image.asset("assets/images/signup.jpg"),
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
                                      controller: nameController,
                                      validator: (val)=> val== ""?"Write your Name":null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.email,color: Colors.black,),
                                        hintText: "Name",
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
                                  signupApi();
                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Padding(padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                          child: Text("SignUp",style: TextStyle(color: Colors.white,fontSize: 16),),),
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              const SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an Account?"),
                                  TextButton(
                                      onPressed: ()
                                      {
                                          Get.to(LoginScreen());
                                      },
                                      child: const Text("Login Here",style: TextStyle(color: Colors.purple,fontSize:15),)),

                                ],
                              ),

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
