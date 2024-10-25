import 'dart:convert';

import 'package:cloths_app/users/controllers/cart_controller.dart';
import 'package:cloths_app/users/orders/order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
class FavouriteFragementScreen extends StatefulWidget {
  const FavouriteFragementScreen({super.key});

  @override
  State<FavouriteFragementScreen> createState() => _FavouriteFragementScreenState();
}

class _FavouriteFragementScreenState extends State<FavouriteFragementScreen> {
  CartController cartDetailController = Get.put(CartController());
  Future<void> deletecartItemsApi(int id,int index)async
  {
   // print(id.toString() +"  *****  "+index.toString());
    try
    {

      final response = await http.post(Uri.parse("http://192.168.1.197 :5000/deleteitem"),
          body: jsonEncode({
            'id': id,


          }),
          headers: {'Content-Type': 'application/json'});


      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());


        if(data["message"]=="Item deleted from the cart")
        {
          cartDetailController.removeCartItem(index);
          print(data);

        }
        else if(data["message"]=='Item not found in the cart')
        {
          print(data);
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

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + "...";
    }
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text("Shopping Cart".tr,style: TextStyle(color: Colors.black),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,size: 28,)),


          ],
        ),
      body: Column(
        children: [
          Container(
            height: Get.height * .7,

            child: Obx(()=>
                ListView.builder(
                    itemCount: cartDetailController.cartList.length,
                    itemBuilder: (context,index){
                      return Container(
                        height: Get.height * .25,
                        width: Get.width * .9,
                        child: Card(
                          elevation: 2.5,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                cartDetailController.cartList[index]!.image!.toString(),
                                width: MediaQuery.of(context).size.width *
                                    0.22,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Product id: "+cartDetailController.cartList[index].cartItemsDetailId!.toString()),
                                     Text("Title : "+truncateText(cartDetailController.cartList[index].title!.toString(),15)),
                                    Text("Category : "+cartDetailController.cartList[index].category!.toString()),

                                    Row(
                                      children: [
                                        Text("Price : "+cartDetailController.cartList[index].price!.toString()),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3, top: 2),
                                          child:
                                          Text("Rating : "+cartDetailController.cartList[index].rating!.rate!.toString()),

                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: InkWell(
                                  onTap: () {
                                    deletecartItemsApi(cartDetailController.cartList[index].cartItemsDetailId!,index);
                                    // print(cartDetailController.cartList[index].cartItemsDetailId!.toString());


                                  },
                                  child: Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                      size: 22),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
          ),
          SizedBox(height: Get.height * .03,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextButton(
                  onPressed: () {
                    print(cartDetailController.cartList.length.toString());

                    Get.to(()=> OrderDetailsScreen());
                  },
                  child: Text(
                    'Proceed'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade700),
            ),
          )

        ]
    )

    );
  }


}
//
//
// child: ListView.builder(
// itemCount: 5,
// itemBuilder: (context,index){
// return Container(
// height: Get.height * .3,
// width: Get.width * .9,
// child: Card(
// elevation: 2.5,
// child:  Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Image.asset(
// 'assets/images/profile.jpg',
// width: MediaQuery.of(context).size.width *
// 0.22,
// ),
// Padding(
// padding: const EdgeInsets.only(left: 5,),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Order id:123445"),
// Text("3 Iitems"),
// Row(
// children: [
// Text("Rs 300"),
// Padding(
// padding: const EdgeInsets.only(
// left: 3, right: 3, top: 2),
// child: Text("Order palced"),
//
// ),
// ],
// ),
//
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left: 3),
// child: InkWell(
// onTap: () {},
// child: Icon(
// Icons.clear,
// color: Colors.black,
// size: 22),
// ),
// )
// ],
// ),
// ),
// );
// }),






