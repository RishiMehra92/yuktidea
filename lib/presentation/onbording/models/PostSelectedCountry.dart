/// status : true
/// message : "Country selection successful "
/// data : {"profile_status":"select.countries","role":"student","selected_country":"Australia"}

class PostSelectedCountry {
  PostSelectedCountry({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PostSelectedCountry.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
PostSelectedCountry copyWith({  bool? status,
  String? message,
  Data? data,
}) => PostSelectedCountry(  status: status ?? _status,
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

/// profile_status : "select.countries"
/// role : "student"
/// selected_country : "Australia"

class Data {
  Data({
      String? profileStatus, 
      String? role, 
      String? selectedCountry,}){
    _profileStatus = profileStatus;
    _role = role;
    _selectedCountry = selectedCountry;
}

  Data.fromJson(dynamic json) {
    _profileStatus = json['profile_status'];
    _role = json['role'];
    _selectedCountry = json['selected_country'];
  }
  String? _profileStatus;
  String? _role;
  String? _selectedCountry;
Data copyWith({  String? profileStatus,
  String? role,
  String? selectedCountry,
}) => Data(  profileStatus: profileStatus ?? _profileStatus,
  role: role ?? _role,
  selectedCountry: selectedCountry ?? _selectedCountry,
);
  String? get profileStatus => _profileStatus;
  String? get role => _role;
  String? get selectedCountry => _selectedCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_status'] = _profileStatus;
    map['role'] = _role;
    map['selected_country'] = _selectedCountry;
    return map;
  }

}