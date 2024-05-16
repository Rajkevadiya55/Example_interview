import 'package:demo/models/favouritePlayer/favourite_player_request_model.dart';
import 'package:demo/models/favouritePlayer/fetch_total_like_response_model.dart';
import 'package:demo/repository/favourite_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/favouritePlayer/favourite_palyer_lst_model.dart';

class FavouritePlayerController extends GetxController {
  PagingController<int, MyFavoritePlayer> pagingController =
      PagingController(firstPageKey: 0);
  int pageNumber = 1;
  bool isLoadingCircular = false;

  final userId = Get.arguments;

  Future<List<MyFavoritePlayer>?> fetchAllFavouritePlayer(
      {FavouritePlayerRequestModel? requestModel}) async {
    print("UserId:::::::::$userId:::::::${Get.arguments}");
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      isLoadingCircular = true;
      update();
      FavouritePlayerLstModel response =
          await FavouritePlayerRepo().getFavouritePlayer(
        header: {
          'Access-Token': 'bearer ${preferences.getString('authToken')}',
          'content-Type': 'application/json'
        },
        requestModel: requestModel,
      );
      isLoadingCircular = false;
      if (response.status!) {
        return response.myFavoritePlayer!;
      } else {
        print('Error::::>>>${response.status}');
        return response.myFavoritePlayer;
      }
    } catch (e) {
      print('Error:::$e');
      isLoadingCircular = false;
    }
    update();
    return null;
  }

  Future getAllPlayerMethod({int pageKey = 1}) async {
    try {
      FavouritePlayerRequestModel requestBody = FavouritePlayerRequestModel();
      requestBody.userId = userId;
      requestBody.page = pageNumber;

      final newItems =
          await fetchAllFavouritePlayer(requestModel: requestBody) ?? [];

      final isLastPage = newItems.isEmpty;

      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (e) {
      isLoadingCircular = false;
      pagingController.error = e;
    }
    update();
  }

  int? totalLike;
  bool isTotalLikeCircular = false;

  Future fetchTotalLike() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      isTotalLikeCircular = true;
      update();
      FetchTotalLikeResponseModel response =
          await FavouritePlayerRepo().getTotalLike(
        header: {
          'Access-Token': 'bearer ${preferences.getString('authToken')}',
          'content-Type': 'application/json'
        },
        userId: userId,
      );
      isTotalLikeCircular = false;
      if (response.status!) {
        totalLike = response.data!.totalLike!;
        print(totalLike);
      } else {
        print('Error::::::::${response.status}');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
