import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_web/models/brand.dart';
import 'package:flutter_web/models/item.dart';
import 'package:flutter_web/models/transaction.dart';

import 'package:flutter_login/flutter_login.dart';

class APIs {
  Future<List<Item>> getItems() async {
    final response = await http.get(
      'http://localhost:8000/api/items/',
    );
    List<Item> items = [];

    if (response.statusCode == 200) {
      List<dynamic> v = json.decode(response.body);
      for (var item in v) {
        items.add(
          Item().fromMap(item),
        );
      }
      print(v[0]);
    } else {
      print('Status code: ${response.statusCode}');
    }
    return items;
  }

  postItems(Item item) async {
    final response = await http.post('http://localhost:8000/api/items/', body: {
      'Name': item.name,
      'QtyInStock': item.quantity.toString(),
      'BuyingPrice': item.buyingPrice.toString(),
      'SellingPrice': item.sellingPrice.toString(),
      'ProfitPerPiece': (item.sellingPrice - item.buyingPrice).toString(),
      'Brand': '4b8751c6-268d-4748-8862-17d72b651c51'
    });
    print(response.body);
  }

  Future<List<Brand>> getBrands() async {
    final response = await http.get(
      'http://localhost:8000/api/brands/',
    );

    List<Brand> brands = [];

    if (response.statusCode == 200) {
      List<dynamic> v = json.decode(response.body);
      for (var item in v) {
        brands.add(
          Brand().fromMap(item),
        );
      }
    } else {
      print('Status code: ${response.statusCode}');
    }
    return brands;
  }

  Future<Brand> getBrand(String id) async {
    final response = await http.get(
      'http://localhost:8000/api/brands/$id',
    );

    Brand brand;
    if (response.statusCode == 200) {
      brand = Brand().fromMap(json.decode(response.body));
      print(brand.name);
    } else {
      print('Status code: ${response.statusCode}');
    }
    return brand;
  }

  Future<List<Transaction>> getTransaction() async {
    final response = await http.get(
      'http://localhost:8000/api/transactions/',
    );

    List<Transaction> transactions = [];

    if (response.statusCode == 200) {
      List<dynamic> v = json.decode(response.body);
      for (var item in v) {
        transactions.add(
          Transaction().fromMap(item),
        );
      }
      print(v[0]);
    } else {
      print('Status code: ${response.statusCode}');
    }
    return transactions;
  }

  Future<String> postAuth(LoginData p1) async {
    var response = await http.post('http://127.0.0.1:8000/auth/',
        body: {'username': p1.name, 'password': p1.password});
    var token = response.body;
    return token;
  }
}
