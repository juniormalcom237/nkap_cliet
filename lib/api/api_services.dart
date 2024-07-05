import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  static const baseUrl = "http://localhost:3000/api/";
  static final supabase = Supabase.instance.client;
  Session? get currentUserSession => supabase.auth.currentSession;
  Future<dynamic> login(String phone, password) async {
    try {
      final response = await supabase.auth
          .signInWithPassword(password: password, email: phone);
      print(response);

      return response;
    } catch (e) {
      print("Not ok ${e.toString()}");
      // throw ServerException(e.toString());
    }
  }

  Future<dynamic> registration(String name, String phone, password) async {
    var url = Uri.parse(baseUrl + "auth/reg");

    print('name: $name, phone: $phone, password: $password');

    try {
      final response = await supabase.auth
          .signUp(password: password, email: phone, data: {'name': name});
      print(response);

      // if (response.user == null) {
      //   throw ServerException('User is null');
      // }
      // print("ojjnj");
      // return UserModel.fromJson(response.user!.toJson());

      return response;
    } catch (e) {
      print("Not ok ${e.toString()}");
      // throw ServerException(e.toString());
    }
  }

  Future<dynamic> getCurrentUserInfo() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabase
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);
        return userData!.first;
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getContributors(String id) async {
    var url = Uri.parse(baseUrl + "users/all/$id");

    try {
      var response = await http.get(
        url,
      );
      final jsondata = response.body;
      if (kDebugMode) {
        print("Data -> " + jsondata.toString());
      }

      final endData = jsonDecode(jsondata);
      return endData;
    } catch (e) {
      if (kDebugMode) {
        print("Data -> " + e.toString());
      }
    }
  }

  Future<dynamic> getTransaction(String id) async {
    var url = Uri.parse(baseUrl + "collect/client/all/$id");

    try {
      var response = await http.get(
        url,
      );
      final jsondata = response.body;
      if (kDebugMode) {
        print("Data -> " + jsondata.toString());
      }

      final endData = jsonDecode(jsondata);
      return endData;
    } catch (e) {
      if (kDebugMode) {
        print("Data -> " + e.toString());
      }
    }
  }

  Future<dynamic> createCollect(
      String amount, String collectorId, String contributorId) async {
    var url = Uri.parse(baseUrl + "collect");

    try {
      var response = await http.post(url, body: {
        "amount": amount,
        "collectorId": collectorId,
        "clientId": contributorId,
      });
      final jsondata = response.body;
      if (kDebugMode) {
        print("Data -> " + jsondata.toString());
      }

      final endData = jsonDecode(jsondata);
      return endData;
    } catch (e) {
      if (kDebugMode) {
        print("Data -> " + e.toString());
      }
    }
  }

  Future<dynamic> scan(String code, userId) async {
    var url = Uri.parse(baseUrl + "verify/$userId");

    try {
      var response = await http.post(url, body: {
        "collectorId": code,
      });
      final jsondata = response.body;
      if (kDebugMode) {
        print("Data -> " + jsondata.toString());
      }

      final endData = jsonDecode(jsondata);
      return endData;
    } catch (e) {
      if (kDebugMode) {
        print("Data -> " + e.toString());
      }
    }
  }
}
