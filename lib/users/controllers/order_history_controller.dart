
import 'package:cloths_app/users/models/order_history_model.dart';
import 'package:cloths_app/users/services/order_history_services.dart';
import 'package:get/get.dart';


class OrderHistoryController extends GetxController
{
  RxBool isloading=false.obs;
  RxList orderHistoryItemList=<OrderHistoryItems>[].obs;
  void onInit()
  {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts ()async
  {
    // isloading(true);
    try
    {
      // RemoteServices.client;
      List<OrderHistoryItems>? orderHistory=await OrderHistoryServices.fetchProducts();
      if(orderHistory !=null)
      {
      //  print(orderHistory[1].order[1].title);
        orderHistoryItemList.value=orderHistory;
      }
    }
    catch(e)
    {
      print(e.toString());
    }
    finally
    {
      isloading(false);
    }


  }

}