import 'package:cloths_app/users/controllers/order_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OrderFragementScreen extends StatefulWidget {
  const OrderFragementScreen({super.key});

  @override
  State<OrderFragementScreen> createState() => _OrderFragementScreenState();
}

class _OrderFragementScreenState extends State<OrderFragementScreen> {
  var orderhistorycontroller=Get.put(OrderHistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text("Order History".tr,style: TextStyle(color: Colors.black),),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,size: 28,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 28,))


      ],
    ),
      body:Obx(()=>
          ListView.builder(
            padding: EdgeInsets.zero,
            // physics: AlwaysScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: orderhistorycontroller.orderHistoryItemList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ExpansionTile(
                  title: ListTile(
                    leading: Image.asset('assets/images/Location.png'),
                    title: Text('Order Id: '+orderhistorycontroller.orderHistoryItemList[index].orderId!.toString()),
                    subtitle: Row(
                      children: [
                        Text("Items: 3"),
                        SizedBox(width: 10,),
                        Text("Price: RS 125"),
                      ],
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Items',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Divider(thickness: 1,),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: orderhistorycontroller.orderHistoryItemList[index].order.length,
                        itemBuilder: (context, index1) {
                          return Card(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              horizontalTitleGap: 0,
                              contentPadding: EdgeInsets.zero,
                              leading: Image.network(
                                orderhistorycontroller.orderHistoryItemList[index]!.order[index1]!.image!.toString(),
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                orderhistorycontroller.orderHistoryItemList[index]!.order[index1]!.title!.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                              subtitle: Text(
                                orderhistorycontroller.orderHistoryItemList[index]!.order[index1]!.category!.toString(),
                                style: TextStyle(fontSize: 10),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 25, top: 15),
                                child: Column(
                                  children: [
                                    Text(
                                      '₹ '+orderhistorycontroller.orderHistoryItemList[index]!.order[index1]!.price!.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      '₹72.00',
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w600,
                                          color:
                                          Colors.grey.shade500,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )

                  ],
                ),
              );
            },
          )
      )

    );
  }
}
