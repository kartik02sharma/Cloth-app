import 'package:cloths_app/users/authentication/login_screen.dart';
import 'package:cloths_app/users/shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileFragementScreen extends StatefulWidget {
  const ProfileFragementScreen({super.key});

  @override
  State<ProfileFragementScreen> createState() => _ProfileFragementScreenState();
}

class _ProfileFragementScreenState extends State<ProfileFragementScreen> {
  @override
 void  signoutUserProfile()async
  {

    var resultresponse =await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Logout".tr),

        content:Text("Do you want to logout from App?".tr),
        actions: [
          TextButton(onPressed: ()
              {
            Get.back();
              }, child: Text("No".tr,style: TextStyle(color: Colors.black),)),
          TextButton(onPressed: ()
          {
            Get.back(result: "Loggout".tr);

          }, child: Text("Yes".tr,style: TextStyle(color: Colors.black),))

        ],
      )
    );
    if(resultresponse=="Loggout".tr)
      {
        box.remove('name');
        box.remove('email');

        Get.off(()=>LoginScreen());
      }
  }
  Widget userInfoItemProfile(IconData iconData,String userdata)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey
        ),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Row(
          children: [
            Icon(iconData,size: 30,color: Colors.black,)
            ,
            const SizedBox(width: 16,),
            Text("${userdata}",style: TextStyle(fontSize: 16),)
          ],
        ),
      ),
    );
  }
  Widget build(BuildContext context) {

    return ListView(
      children: [
        Center(
          child: Image.asset("assets/images/profile.jpg",width: 300,)),
         SizedBox(height: Get.height * .05),
        userInfoItemProfile(Icons.person, box.read('name').toString()
        ),
         SizedBox(height: Get.height * .05),
        userInfoItemProfile(Icons.email, box.read('email').toString()),
         SizedBox(height: Get.height * .05),
        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: ()
              {
             signoutUserProfile();
              },
              borderRadius: BorderRadius.circular(32),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,
                vertical: 12),
                child: Text("Sign Out".tr,style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
            ),

          ),
        )




      ],

    );
  }
}
