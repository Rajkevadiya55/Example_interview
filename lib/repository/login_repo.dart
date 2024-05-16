import 'package:demo/apiServices/base_services.dart';
import 'package:demo/apiServices/post_services.dart';
import 'package:demo/models/login/login_request_model.dart';
import 'package:demo/models/login/login_response_model.dart';

class LoginRepo {
  Future userLogin({LoginRequestModel? requestModel}) async {
    final response = await PostService().getResponse(
        url: ApiRoutes.login,
        body: requestModel?.toJson(),
        header: {'content-Type': 'application/json'});
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(response);
    return loginResponseModel;
  }
}
