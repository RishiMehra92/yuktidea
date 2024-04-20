/// status : true
/// message : "User Logged out successfully"
/// data : "Logout successful"

class LogoutDeleteResponse {
  LogoutDeleteResponse({
      bool? status, 
      String? message, 
      String? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LogoutDeleteResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }
  bool? _status;
  String? _message;
  String? _data;
LogoutDeleteResponse copyWith({  bool? status,
  String? message,
  String? data,
}) => LogoutDeleteResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}