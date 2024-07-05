import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nkap/app/model/User.dart';
import 'package:nkap/app/screens/home_screen.dart';

import '../app/widgets/snackbar.dart';
import 'api_services.dart';

class MyController extends GetxController {
  var isLoading = false.obs;

  var localDB = GetStorage();

  var apiClient = ApiClient();
  Future<void> login(String telephone, String password) async {
    isLoading.value = true;
    var response = await apiClient.login(telephone, password);
    print('user ${response.user}');
    isLoading.value = false;
    // if (response["status"] == true) {
    //   localDB.write("authToken", response['access_token']);
    //   localDB.write("userData", response['data']);
    //   // localDB.write(, value)
    //
    // } else {
    //
    // }

    if (response.user != null) {
      var currentUser = await apiClient.getCurrentUserInfo();
      if (currentUser != null) {
        localDB.write("userData", currentUser);
        Get.offAll(() => HomeScreen());
        MySnackbar.mySnackbar("", "Connected Successfully");
      } else {
        MySnackbar.mySnackbar("", "invalid credentials");
      }
    } else {
      MySnackbar.mySnackbar("", "invalid credentials");
    }
  }

  Future<void> registration(
      String name, String telephone, String password) async {
    isLoading.value = true;
    var response = await apiClient.registration(name, telephone, password);
    if (response.user != null) {
      isLoading.value = false;
      MySnackbar.mySnackbar("", "Account created successfully");
    } else {
      isLoading.value = false;
      MySnackbar.mySnackbar("", "Please verify your connexion");
    }
  }

  // Future<void> get(
  //     String name, String telephone, String password) async {
  //   isLoading.value = true;
  //   var response = await apiClient.registration(name, telephone, password);
  //   if (response.user != null) {
  //     isLoading.value = false;
  //     MySnackbar.mySnackbar("", "Account created successfully");
  //   } else {
  //     isLoading.value = false;
  //     MySnackbar.mySnackbar("", "Please verify your connexion");
  //   }
  // }

  //
  // Future<List<Users>> getContributors(String id) async {
  //   var response = await apiClient.getContributors(id);
  //
  //   if (response['status'] == true) {
  //     // localDB.write("contributors", response['data']);
  //     final jsondata = response['data'] as List;
  //     List<Users> user =
  //         jsondata.map((dynamic item) => Users.fromJson(item)).toList();
  //     return user;
  //   } else {
  //     throw "no data";
  //   }
  // }
  //
  Future<List<Transaction>> getTransaction(String id) async {
    var response = await apiClient.getTransaction(id);
    if (response['status'] == true) {
      final jsondata = response['data'] as List;
      List<Transaction> transaction =
          jsondata.map((dynamic item) => Transaction.fromJson(item)).toList();
      return transaction;
    } else {
      throw "no data";
    }
  }

  Future<void> createCollect(
      String amount, String collectorId, String clientId) async {
    isLoading.value = true;
    var response = await apiClient.createCollect(amount, collectorId, clientId);

    if (response['status'] == true) {
      isLoading.value = false;
      Get.back();
      MySnackbar.mySnackbar("", "Collect added Successfully");
    } else {
      MySnackbar.mySnackbar("", "Please verify your connection");
    }
  }

  Future<void> scan(String code) async {
    var response =
        await apiClient.scan(code, localDB.read("userData")['collector']['id']);
    if (response['status'] == true) {
      isLoading.value = false;
      Get.back();
      MySnackbar.mySnackbar("", "Collector is assigned");
    } else if (response['status'] == false) {
      MySnackbar.mySnackbar("", "Collector isn't assign");
    }
  }
}
