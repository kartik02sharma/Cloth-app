import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: Get.height * .30,

            child: Stack(
              children: [
                Container(
                  height: Get.height * .30,
                  color: Colors.green,
                ),
                Positioned(
                  left: 20,
                  bottom: 22,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                      child: Row(
                        children: [
                          Text("4 ",style: TextStyle(fontSize: 13),),
                          Icon(Icons.star,size: 13,),
                          Text(" | ",style: TextStyle(fontSize: 13)),
                          Text("5.8 ",style: TextStyle(fontSize: 13))
                        ],
                      ),
                    ),

                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Roadster hoodies",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    SizedBox(height: Get.height * .002,),
                    Text("Us poplo",style: TextStyle(color: Colors.grey),),
                    SizedBox(height: Get.height * .002,),
                    Row(
                      children: [
                        Text("RS 3555",style: TextStyle(color: Colors.grey),),
                        SizedBox(width: Get.width * .01,),
                        Text("RS  3555",style: TextStyle(fontWeight: FontWeight.w600),),
                        SizedBox(width: Get.width * .01,),
                        Text("65 % off",style: TextStyle(color: Colors.orange)),
                        SizedBox(width: Get.width * .01,),
                      ],
                    )
                  ],
                ),
                IconButton(onPressed: (){},icon: Icon(Icons.favorite_outline),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
