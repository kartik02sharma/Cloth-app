import 'package:cloths_app/users/Api/api.dart';
import 'package:cloths_app/users/models/cart_model.dart';

import 'package:http/http.dart' as http;


class CartDetailsServices
{

  static var client= http.Client();
  static Future<List<CartItemsDetails>?> fetchProducts() async
  {
    var response =await client.get(Uri.parse(Api.url+"/cartitems"));
    if(response.statusCode==200)
    {
      print(response.statusCode);
      // var jsonString=response.body;
      //
      // print(jsonString.runtimeType);
      return cartItemsDetailsFromJson(response.body);
    }
    else
    {
      return null;
    }
  }



}