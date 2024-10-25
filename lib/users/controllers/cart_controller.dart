import 'package:cloths_app/users/models/cart_model.dart';
import 'package:cloths_app/users/services/cart_details_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController
{
  RxBool isloading=false.obs;
  RxList<CartItemsDetails> cartList =<CartItemsDetails>[].obs;
  void onInit()
  {
    fetchCartItems();
    super.onInit();
  }
  void fetchCartItems()async
  {
    // isloading(true);
    try
    {
      // RemoteServices.client;
      List<CartItemsDetails>? carts=await CartDetailsServices.fetchProducts();
     // print(carts.toString());
      if(carts !=null)
      {
        print(carts.length);
        print(carts);

        cartList.value =carts;
      }
    }
    catch(e)
    {
      print("error");
      print(e.toString());
    }
    finally
    {
      isloading(false);
    }


  }

  void removeCartItem(int index) {
    if (index >= 0 && index < cartList.length) {
      print(index);
      cartList.removeAt(index);
    }
  }
  void AddCartItem(CartItemsDetails newItem) {
    cartList.add(newItem);
  }


}