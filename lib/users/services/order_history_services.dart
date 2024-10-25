
import 'package:cloths_app/users/Api/api.dart';
import 'package:cloths_app/users/models/order_history_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class OrderHistoryServices
{

  static var client= http.Client();
  static Future<List<OrderHistoryItems>?> fetchProducts() async
  {
    var response =await client.get(Uri.parse(Api.url+"/orderhistory"));
    if(response.statusCode==200)
    {
      print(response.statusCode);
      // var jsonString=response.body;
      return orderHistoryItemsFromJson(response.body.toString());
    }
    else
    {
      return null;
    }
  }



}