import 'package:cloths_app/users/Api/api.dart';
import 'package:cloths_app/users/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ProductDetailsServices
{

  static var client= http.Client();
  static Future<List<ProductDetailsModel>?> fetchProducts() async
  {
    var response =await client.get(Uri.parse(Api.url+"/products"));
    if(response.statusCode==200)
    {
      print(response.statusCode);
      // var jsonString=response.body;
      return productDetailsModelFromJson(response.body.toString());
    }
    else
    {
      return null;
    }
  }



}