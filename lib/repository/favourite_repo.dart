import 'package:demo/apiServices/base_services.dart';
import 'package:demo/apiServices/post_services.dart';
import 'package:demo/models/favouritePlayer/favourite_palyer_lst_model.dart';
import 'package:demo/models/favouritePlayer/favourite_player_request_model.dart';
import 'package:demo/models/favouritePlayer/fetch_total_like_response_model.dart';

class FavouritePlayerRepo {
  Future getFavouritePlayer(
      {FavouritePlayerRequestModel? requestModel, dynamic header}) async {
    final response = await PostService().getResponse(
      url: ApiRoutes.favouritePlayer,
      body: requestModel?.toJson(),
      header: header,
    );
    print("Response::::::$response");
    FavouritePlayerLstModel favouritePlayerLstModel =
        FavouritePlayerLstModel.fromJson(response);
    return favouritePlayerLstModel;
  }

  Future getTotalLike({int? userId, dynamic header}) async {
    final response = await PostService().getResponse(
      url: ApiRoutes.getUserTotalLike,
      body: {"user_id": userId},
      header: header,
    );
    print("Response::::::$response");
    FetchTotalLikeResponseModel fetchTotalLikeResponseModel =
        FetchTotalLikeResponseModel.fromJson(response);
    return fetchTotalLikeResponseModel;
  }
}
