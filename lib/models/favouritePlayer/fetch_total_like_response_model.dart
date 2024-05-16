class FetchTotalLikeResponseModel {
  DataModel? data;
  String? message;
  bool? status;

  FetchTotalLikeResponseModel({this.data, this.message, this.status});

  FetchTotalLikeResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataModel.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class DataModel {
  int? id;
  dynamic googleId;
  String? nickName;
  String? recommenderName;
  String? email;
  String? countryCode;
  int? phone;
  String? type;
  String? profileImage;
  int? totalLike;
  int? totalReferralLike;
  int? spentLike;
  int? totalDiamond;
  int? spentDiamond;
  int? totalComment;
  int? level;
  int? idealId;
  String? idealDate;
  dynamic emailVerifiedAt;
  dynamic desc;
  String? lastLogin;
  int? appOpen;
  String? userCode;
  int? referralCodeId;
  int? status;
  int? isBlock;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;

  DataModel(
      {this.id,
      this.googleId,
      this.nickName,
      this.recommenderName,
      this.email,
      this.countryCode,
      this.phone,
      this.type,
      this.profileImage,
      this.totalLike,
      this.totalReferralLike,
      this.spentLike,
      this.totalDiamond,
      this.spentDiamond,
      this.totalComment,
      this.level,
      this.idealId,
      this.idealDate,
      this.emailVerifiedAt,
      this.desc,
      this.lastLogin,
      this.appOpen,
      this.userCode,
      this.referralCodeId,
      this.status,
      this.isBlock,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    googleId = json['google_id'];
    nickName = json['nick_name'];
    recommenderName = json['recommender_name'];
    email = json['email'];
    countryCode = json['country_code'];
    phone = json['phone'];
    type = json['type'];
    profileImage = json['profile_image'];
    totalLike = json['total_like'];
    totalReferralLike = json['total_referral_like'];
    spentLike = json['spent_like'];
    totalDiamond = json['total_diamond'];
    spentDiamond = json['spent_diamond'];
    totalComment = json['total_comment'];
    level = json['level'];
    idealId = json['ideal_id'];
    idealDate = json['ideal_date'];
    emailVerifiedAt = json['email_verified_at'];
    desc = json['desc'];
    lastLogin = json['last_login'];
    appOpen = json['app_open'];
    userCode = json['user_code'];
    referralCodeId = json['referral_code_id'];
    status = json['status'];
    isBlock = json['is_block'];
    isDeleted = json['is_deleted'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['google_id'] = this.googleId;
    data['nick_name'] = this.nickName;
    data['recommender_name'] = this.recommenderName;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['profile_image'] = this.profileImage;
    data['total_like'] = this.totalLike;
    data['total_referral_like'] = this.totalReferralLike;
    data['spent_like'] = this.spentLike;
    data['total_diamond'] = this.totalDiamond;
    data['spent_diamond'] = this.spentDiamond;
    data['total_comment'] = this.totalComment;
    data['level'] = this.level;
    data['ideal_id'] = this.idealId;
    data['ideal_date'] = this.idealDate;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['desc'] = this.desc;
    data['last_login'] = this.lastLogin;
    data['app_open'] = this.appOpen;
    data['user_code'] = this.userCode;
    data['referral_code_id'] = this.referralCodeId;
    data['status'] = this.status;
    data['is_block'] = this.isBlock;
    data['is_deleted'] = this.isDeleted;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
