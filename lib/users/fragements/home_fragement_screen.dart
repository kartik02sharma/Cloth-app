
import 'dart:convert';

import 'package:cloths_app/users/controllers/cart_controller.dart';
import 'package:cloths_app/users/controllers/connectivity_controller.dart';
import 'package:cloths_app/users/controllers/product_controller.dart';
import 'package:cloths_app/users/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class HomeFragementScreen extends StatefulWidget {
  const HomeFragementScreen({super.key});

  @override
  State<HomeFragementScreen> createState() => _HomeFragementScreenState();
}

class _HomeFragementScreenState extends State<HomeFragementScreen> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }
  ConnectivityController connectivityController=Get.put(ConnectivityController());
  var productDetailController = Get.put(ProductController());
  CartController cartDetailController = Get.find<CartController>();

  RxBool isFavoritePressed = false.obs;
  Future<void> AddtocartItemsApi(int id,int index)async
  {
     print(id.toString() +"  *****  "+index.toString());
    try
    {

      final response = await http.post(Uri.parse("http://192.168.1.197:5000/addtocart"),
          body: jsonEncode({
            'id': id,


          }),
          headers: {'Content-Type': 'application/json'});


      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());


        if(data["message"]=="Item added successfully")
        {
          //cartDetailController.removeCartItem(index);
          CartItemsDetails newItem = productDetailController.productList[index] as CartItemsDetails;
          cartDetailController.AddCartItem(newItem );
          print(data);


        }
        else if(data["message"]=='Item already in cart')
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 28,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 28,
              )),
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        onTap: () {
                          Get.back();
                          Get.dialog(AlertDialog(
                            title: Text("Choose a language"),
                            content: Container(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            // print(locale[index]['name'].toString());
                                            updateLanguage(
                                                locale[index]['locale']);
                                          },
                                          child: Text(locale[index]['name'])),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      color: Colors.grey,
                                    );
                                  },
                                  itemCount: locale.length),
                            ),
                          ));
                        },
                        title: Text("Change Language".tr),
                        leading: Icon(Icons.dashboard),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        title: InkWell(
                            onTap: () {
                              Get.back();
                              Get.defaultDialog(
                                  title: "Choose Theme",
                                  content: Column(
                                    children: [
                                      ListTile(
                                        onTap: () {
                                          Get.back();
                                          Get.changeTheme(ThemeData.dark());
                                        },
                                        leading: Icon(
                                          Icons.dark_mode,
                                          color: Colors.black,
                                        ),
                                        title: Text("Dark Mode"),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          Get.back();
                                          Get.changeTheme(ThemeData.light());
                                        },
                                        leading: Icon(
                                          Icons.light_mode,
                                          color: Colors.black,
                                        ),
                                        title: Text("Light Mode"),
                                      )
                                    ],
                                  )
                              );
                            },
                            child: Text("Change Theme".tr)),
                        leading: Icon(Icons.theaters_sharp),
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: ListTile(
                        title: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Text("Customer Support".tr)),
                        leading: Icon(Icons.call),
                      ),
                    )
                  ]),
        ],
        title: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mens Cloths".tr,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "2435 " + "Items".tr,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: GetX<ProductController>(
        builder: (controller) {
          return ListView.builder(
              itemCount: productDetailController.productList.length,
              itemBuilder: (context, index) {
                return Container(
                  //width: Get.width * .04,
                  child: Column(
                    children: [
                      Container(
                        height: Get.height * .30,
                        child: Stack(
                          children: [
                            Container(
                              height: Get.height * .30,
                              //color: Colors.green,
                              child: Image.network(
                                productDetailController
                                    .productList[index]!.image!
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 22,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "4 ",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 13,
                                      ),
                                      Text(" | ",
                                          style: TextStyle(fontSize: 13)),
                                      Text(
                                          productDetailController
                                              .productList[index]!.rating!.rate!
                                              .toString(),
                                          style: TextStyle(fontSize: 13))
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  truncateText(
                                      productDetailController
                                          .productList[index]!.title!
                                          .toString(),
                                      30),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: Get.height * .002,
                                ),
                                Text(
                                  productDetailController
                                      .productList[index]!.category!
                                      .toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: Get.height * .002,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "RS  " +
                                          productDetailController
                                              .productList[index]!
                                              .rating!
                                              .count!
                                              .toString(),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: Get.width * .01,
                                    ),
                                    Text(
                                      "RS " +
                                          productDetailController
                                              .productList[index]!.price!
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: Get.width * .01,
                                    ),
                                    Text("65 % off",
                                        style: TextStyle(color: Colors.orange)),
                                    SizedBox(
                                      width: Get.width * .01,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Obx(() => IconButton(
                                onPressed: () {
                                  // isFavoritePressed.value =
                                  //     !isFavoritePressed.value;
                                  AddtocartItemsApi(productDetailController.productList[index].productDetailsModelId, index);
                                  print(productDetailController.productList[index].productDetailsModelId.toString());
                                },
                                icon: isFavoritePressed.value
                                    ? Icon(
                                        Icons.favorite_outline,
                                      )
                                    : Icon(
                                        Icons.favorite_outlined,
                                        color: Colors.red,
                                      )))
                          ],
                        ),
                      )
                    ],
                  ),
                );
                ;
              });
        },
      ),
    );
  }
}
