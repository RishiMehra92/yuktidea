/// status : true
/// message : "Verification OTP sent"
/// data : {"id":8,"name":null,"email":null,"country_id":95,"phone":"+919876543210","phone_verified_at":null,"avatar":null,"approved_at":null,"details_type":null,"details_id":null,"profile_status_id":1,"review_count":0,"review_rating":"0.0","created_at":"2024-04-17T16:58:52.000000Z","updated_at":"2024-04-17T16:58:52.000000Z"}

class LoginResponse {
  LoginResponse({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LoginResponse copyWith({  bool? status,
  String? message,
  Data? data,
}) => LoginResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 8
/// name : null
/// email : null
/// country_id : 95
/// phone : "+919876543210"
/// phone_verified_at : null
/// avatar : null
/// approved_at : null
/// details_type : null
/// details_id : null
/// profile_status_id : 1
/// review_count : 0
/// review_rating : "0.0"
/// created_at : "2024-04-17T16:58:52.000000Z"
/// updated_at : "2024-04-17T16:58:52.000000Z"

class Data {
  Data({
      num? id, 
      dynamic name, 
      dynamic email, 
      num? countryId, 
      String? phone, 
      dynamic phoneVerifiedAt, 
      dynamic avatar, 
      dynamic approvedAt, 
      dynamic detailsType, 
      dynamic detailsId, 
      num? profileStatusId, 
      num? reviewCount, 
      String? reviewRating, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _countryId = countryId;
    _phone = phone;
    _phoneVerifiedAt = phoneVerifiedAt;
    _avatar = avatar;
    _approvedAt = approvedAt;
    _detailsType = detailsType;
    _detailsId = detailsId;
    _profileStatusId = profileStatusId;
    _reviewCount = reviewCount;
    _reviewRating = reviewRating;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _countryId = json['country_id'];
    _phone = json['phone'];
    _phoneVerifiedAt = json['phone_verified_at'];
    _avatar = json['avatar'];
    _approvedAt = json['approved_at'];
    _detailsType = json['details_type'];
    _detailsId = json['details_id'];
    _profileStatusId = json['profile_status_id'];
    _reviewCount = json['review_count'];
    _reviewRating = json['review_rating'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  dynamic _name;
  dynamic _email;
  num? _countryId;
  String? _phone;
  dynamic _phoneVerifiedAt;
  dynamic _avatar;
  dynamic _approvedAt;
  dynamic _detailsType;
  dynamic _detailsId;
  num? _profileStatusId;
  num? _reviewCount;
  String? _reviewRating;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  dynamic name,
  dynamic email,
  num? countryId,
  String? phone,
  dynamic phoneVerifiedAt,
  dynamic avatar,
  dynamic approvedAt,
  dynamic detailsType,
  dynamic detailsId,
  num? profileStatusId,
  num? reviewCount,
  String? reviewRating,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  countryId: countryId ?? _countryId,
  phone: phone ?? _phone,
  phoneVerifiedAt: phoneVerifiedAt ?? _phoneVerifiedAt,
  avatar: avatar ?? _avatar,
  approvedAt: approvedAt ?? _approvedAt,
  detailsType: detailsType ?? _detailsType,
  detailsId: detailsId ?? _detailsId,
  profileStatusId: profileStatusId ?? _profileStatusId,
  reviewCount: reviewCount ?? _reviewCount,
  reviewRating: reviewRating ?? _reviewRating,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  dynamic get name => _name;
  dynamic get email => _email;
  num? get countryId => _countryId;
  String? get phone => _phone;
  dynamic get phoneVerifiedAt => _phoneVerifiedAt;
  dynamic get avatar => _avatar;
  dynamic get approvedAt => _approvedAt;
  dynamic get detailsType => _detailsType;
  dynamic get detailsId => _detailsId;
  num? get profileStatusId => _profileStatusId;
  num? get reviewCount => _reviewCount;
  String? get reviewRating => _reviewRating;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['country_id'] = _countryId;
    map['phone'] = _phone;
    map['phone_verified_at'] = _phoneVerifiedAt;
    map['avatar'] = _avatar;
    map['approved_at'] = _approvedAt;
    map['details_type'] = _detailsType;
    map['details_id'] = _detailsId;
    map['profile_status_id'] = _profileStatusId;
    map['review_count'] = _reviewCount;
    map['review_rating'] = _reviewRating;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}