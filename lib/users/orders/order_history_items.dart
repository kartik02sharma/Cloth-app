import 'package:flutter/material.dart';
class OrderHistoryItemsScreen extends StatefulWidget {

   OrderHistoryItemsScreen({super.key});

  @override
  State<OrderHistoryItemsScreen> createState() => _OrderHistoryItemsScreenState();
}

class _OrderHistoryItemsScreenState extends State<OrderHistoryItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History Items'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 10, bottom: 10, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '10"30 AM',
                      style: TextStyle(
                          fontSize: 11,
                          color:
                          Colors.grey.shade600,
                    ),
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Id: 2122',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black87),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width *
                        //       0.45,
                        // ),
                        Row(
                          children: [
                            Text(
                              '3 Items',
                              style: TextStyle(
                                  fontSize: 11,
                                  color:
                                  Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              '|',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87),
                            ),
                            Text(
                              "10;11:2023",
                              style: TextStyle(
                                  fontSize: 11,
                                  color:
                                  Colors.grey.shade500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Rs. 1050',
                          style: TextStyle(
                              fontSize: 11,
                              color:
                              Colors.grey.shade500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Completed",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Delivery Address',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Location.png',
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        '43, Electronics City Phase 1,\n'
                            'Electronic City',
                        style: TextStyle(color:
                            Colors.grey.shade500,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: Image.network(
                       "assets/images/Location.png",
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      "ads",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                    subtitle: Text(
                      "100",
                      style: TextStyle(fontSize: 10),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 25, top: 15),
                      child: Column(
                        children: [
                          Text(
                            '₹ 100',
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
  }
}
