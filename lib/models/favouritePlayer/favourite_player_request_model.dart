class FavouritePlayerRequestModel {
  int? userId;
  int? page;

  FavouritePlayerRequestModel({this.userId, this.page});

  FavouritePlayerRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['page'] = this.page;
    return data;
  }
}
