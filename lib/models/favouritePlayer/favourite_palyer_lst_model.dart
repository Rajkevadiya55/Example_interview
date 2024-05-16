class FavouritePlayerLstModel {
  List<MyFavoritePlayer>? myFavoritePlayer;
  List<MyIdelPlayer>? myIdelPlayer;
  String? message;
  bool? status;

  FavouritePlayerLstModel(
      {this.myFavoritePlayer, this.myIdelPlayer, this.message, this.status});

  FavouritePlayerLstModel.fromJson(Map<String, dynamic> json) {
    if (json['my_favorite_player'] != null) {
      myFavoritePlayer = <MyFavoritePlayer>[];
      json['my_favorite_player'].forEach((v) {
        myFavoritePlayer!.add(new MyFavoritePlayer.fromJson(v));
      });
    }
    if (json['my_idel_player'] != null) {
      myIdelPlayer = <MyIdelPlayer>[];
      json['my_idel_player'].forEach((v) {
        myIdelPlayer!.add(new MyIdelPlayer.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myFavoritePlayer != null) {
      data['my_favorite_player'] =
          this.myFavoritePlayer!.map((v) => v.toJson()).toList();
    }
    if (this.myIdelPlayer != null) {
      data['my_idel_player'] =
          this.myIdelPlayer!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class MyFavoritePlayer {
  int? id;
  String? playerName;
  String? teamName;
  int? totalLike;
  String? teamShortName;
  String? playerImage;

  MyFavoritePlayer(
      {this.id,
      this.playerName,
      this.teamName,
      this.totalLike,
      this.teamShortName,
      this.playerImage});

  MyFavoritePlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerName = json['player_name'];
    teamName = json['team_name'];
    totalLike = json['total_like'];
    teamShortName = json['team_short_name'];
    playerImage = json['player_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_name'] = this.playerName;
    data['team_name'] = this.teamName;
    data['total_like'] = this.totalLike;
    data['team_short_name'] = this.teamShortName;
    data['player_image'] = this.playerImage;
    return data;
  }
}

class MyIdelPlayer {
  int? id;
  String? playerName;
  String? teamName;
  int? totalLike;
  String? playerImage;

  MyIdelPlayer(
      {this.id,
      this.playerName,
      this.teamName,
      this.totalLike,
      this.playerImage});

  MyIdelPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerName = json['player_name'];
    teamName = json['team_name'];
    totalLike = json['total_like'];
    playerImage = json['player_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['player_name'] = this.playerName;
    data['team_name'] = this.teamName;
    data['total_like'] = this.totalLike;
    data['player_image'] = this.playerImage;
    return data;
  }
}
