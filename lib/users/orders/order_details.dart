import 'package:cloths_app/users/controllers/cart_controller.dart';
import 'package:cloths_app/users/orders/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  CartController cartDetailController = Get.find<CartController>();
  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + "...";
    }
  }

  var _razorpay = Razorpay();
  void initState()
  {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print(response!.orderId);
    print(response!.paymentId);
    print(response!.signature);
    //API if else
    Get.to(()=> ConfirmationScreen());

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("PAYMENT DETAILS------");
    print(response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  @override
  void dispose()
  {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Orders Details"),
        backgroundColor: Colors.white,
        elevation: 1 ,
        centerTitle: true,
      ),
      body:   SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.38,
              child: Obx(()=>
                  ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 0),
                itemCount: cartDetailController.cartList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        minLeadingWidth: 2,
                        contentPadding: EdgeInsets.zero,
                        leading: Image.network(
                          cartDetailController.cartList[index].image!.toString(),
                          //"assets/images/Location.png",
                          width: 60,
                        ),
                        title: Text(truncateText(cartDetailController.cartList[index].title!.toString(), 15)
                        ),
                        subtitle: Text(cartDetailController.cartList[index].category!.toString()
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Wrap(
                            spacing: 6,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.035,
                                width:
                                MediaQuery.of(context).size.width * 0.17,

                                child: Center(
                                    child: Text(
                                        "₹ "+cartDetailController.cartList[index].price!.toString()
                                    )),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  );
                },
              ))
            ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Divider(
                  thickness: 1,
                ),
              ),


              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Address',

                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/Location.png',
                          width: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Near Skit Gate no 3,     \nJagatpura,Jaipur,\n302017",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 120,),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 25, right: 25, top: 5),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Order Details',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '₹ 500',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Charge',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Free  ₹50',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Saving',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '₹ 50',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 5),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'To Pay',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Text(
                                '₹ 500',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 15),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Review Your order to avoid cancellation',
                        style:
                        TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            text: 'NOTE: ',
                            style: TextStyle(
                                color: Colors.green, fontSize: 13),
                            children: [
                              TextSpan(
                                  text:
                                  'Order can not be cancelled and non-\n'
                                      'refundable once placed the order.',
                                  style: TextStyle(
                                      color: Colors.grey))
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.048,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: TextButton(
                        onPressed: () {
                          var options = {
                            'key': 'rzp_test_FHyzLQaHntCDti',
                            'amount': 1*100,
                            'name': 'Acme Corp.',
                            'description': 'Fine T-Shirt',
                            'prefill': {
                              'contact': '8888888888',
                              'email': 'test@razorpay.com'
                            }
                          };
                          _razorpay.open(options);
                        },
                        child: Text(
                          'Proceed to pay',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ])
          ],
        ),
      ),

    );
  }
}
