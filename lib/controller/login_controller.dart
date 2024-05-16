import 'package:demo/apiServices/base_services.dart';
import 'package:demo/apiServices/post_services.dart';
import 'package:demo/models/login/login_request_model.dart';
import 'package:demo/models/login/login_response_model.dart';
import 'package:demo/pages/favourite_player_page.dart';
import 'package:demo/repository/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoaderCircular = false;

  _storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken') ?? '';
    return token;
  }

  Future loginApiCall({required String email, password}) async {
    try {
      isLoaderCircular = true;
      update();
      LoginResponseModel responseData = await LoginRepo().userLogin(
        requestModel: LoginRequestModel(email: email, password: password),
      );
      isLoaderCircular = false;
      if (responseData.status!) {
        Data data = responseData.data!;
        _storeToken(data.token!);
        final token = await getToken();
        print('Token:::::::::::::$token');
        Get.off(() => const FavouritePlayerPage(),arguments: data.id);

      } else {
        print('Error::::${responseData.status}');
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
