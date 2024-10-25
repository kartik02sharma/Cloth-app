import 'package:cloths_app/users/models/product_model.dart';
import 'package:cloths_app/users/services/ProductDetailsServices.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
{
  RxBool isloading=false.obs;
  var productList=<ProductDetailsModel>[].obs;
  void onInit()
  {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts ()async
  {
    isloading(true);
    try
    {
      // RemoteServices.client;
      var products=await ProductDetailsServices.fetchProducts();
      if(products !=null)
      {
          print(products);
        productList.value=products;
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