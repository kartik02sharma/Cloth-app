import 'package:cloths_app/users/fragements/dashboard_of_fragements.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      Lottie.asset("assets/animation/lottie.json",
      height: 250,
      fit: BoxFit.cover,

      repeat: false,reverse: true
      ),
            Text("Order Confirmed!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: Get.height * .05,),
            Text("Your order has been confirmed,we will send",style: TextStyle()),
        Text("  you confirmation mail shortly"
            ),
            SizedBox(height: Get.height * .2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: (()=>DashboardOfFragements()
                ),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: Get.height*.08,
                  child: Center(child: Text("Continue Shopping",style: TextStyle(color: Colors.white),)),
                ),
              ),
            )





          ],
        ),
      ),
    );
  }
}
