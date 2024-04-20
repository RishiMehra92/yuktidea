/// status : true
/// message : "Phone Verified"
/// data : {"profile_status":"none","role":"student","phone":"+917888928106","phone_verified_at":"2024-04-18T12:14:45.000000Z","access_token":"10|Wv1uGGaqCRmxTX9yLWFoF7Sg96qFrpFm16rvndqh7ffa0b03","token_type":"bearer","expires_in":0}

class VerifyOtpResponse {
  VerifyOtpResponse({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  VerifyOtpResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
VerifyOtpResponse copyWith({  bool? status,
  String? message,
  Data? data,
}) => VerifyOtpResponse(  status: status ?? _status,
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

/// profile_status : "none"
/// role : "student"
/// phone : "+917888928106"
/// phone_verified_at : "2024-04-18T12:14:45.000000Z"
/// access_token : "10|Wv1uGGaqCRmxTX9yLWFoF7Sg96qFrpFm16rvndqh7ffa0b03"
/// token_type : "bearer"
/// expires_in : 0

class Data {
  Data({
      String? profileStatus, 
      String? role, 
      String? phone, 
      String? phoneVerifiedAt, 
      String? accessToken, 
      String? tokenType, 
      num? expiresIn,}){
    _profileStatus = profileStatus;
    _role = role;
    _phone = phone;
    _phoneVerifiedAt = phoneVerifiedAt;
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
}

  Data.fromJson(dynamic json) {
    _profileStatus = json['profile_status'];
    _role = json['role'];
    _phone = json['phone'];
    _phoneVerifiedAt = json['phone_verified_at'];
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
  }
  String? _profileStatus;
  String? _role;
  String? _phone;
  String? _phoneVerifiedAt;
  String? _accessToken;
  String? _tokenType;
  num? _expiresIn;
Data copyWith({  String? profileStatus,
  String? role,
  String? phone,
  String? phoneVerifiedAt,
  String? accessToken,
  String? tokenType,
  num? expiresIn,
}) => Data(  profileStatus: profileStatus ?? _profileStatus,
  role: role ?? _role,
  phone: phone ?? _phone,
  phoneVerifiedAt: phoneVerifiedAt ?? _phoneVerifiedAt,
  accessToken: accessToken ?? _accessToken,
  tokenType: tokenType ?? _tokenType,
  expiresIn: expiresIn ?? _expiresIn,
);
  String? get profileStatus => _profileStatus;
  String? get role => _role;
  String? get phone => _phone;
  String? get phoneVerifiedAt => _phoneVerifiedAt;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_status'] = _profileStatus;
    map['role'] = _role;
    map['phone'] = _phone;
    map['phone_verified_at'] = _phoneVerifiedAt;
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    return map;
  }

}