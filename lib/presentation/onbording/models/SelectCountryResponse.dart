/// status : true
/// message : "List of Available Countries"
/// data : {"profile_status":"none","role":"student","selected_country":null,"countries":[{"id":1,"name":"Canada","flag":"https://flagcdn.com/ca.svg","image":"https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/canada.png"},{"id":2,"name":"Australia","flag":"https://flagcdn.com/au.svg","image":"https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/australia.png"}]}

class SelectCountryResponse {
  SelectCountryResponse({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SelectCountryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
SelectCountryResponse copyWith({  bool? status,
  String? message,
  Data? data,
}) => SelectCountryResponse(  status: status ?? _status,
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
/// selected_country : null
/// countries : [{"id":1,"name":"Canada","flag":"https://flagcdn.com/ca.svg","image":"https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/canada.png"},{"id":2,"name":"Australia","flag":"https://flagcdn.com/au.svg","image":"https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/australia.png"}]

class Data {
  Data({
      String? profileStatus, 
      String? role, 
      dynamic selectedCountry, 
      List<Countries>? countries,}){
    _profileStatus = profileStatus;
    _role = role;
    _selectedCountry = selectedCountry;
    _countries = countries;
}

  Data.fromJson(dynamic json) {
    _profileStatus = json['profile_status'];
    _role = json['role'];
    _selectedCountry = json['selected_country'];
    if (json['countries'] != null) {
      _countries = [];
      json['countries'].forEach((v) {
        _countries?.add(Countries.fromJson(v));
      });
    }
  }
  String? _profileStatus;
  String? _role;
  dynamic _selectedCountry;
  List<Countries>? _countries;
Data copyWith({  String? profileStatus,
  String? role,
  dynamic selectedCountry,
  List<Countries>? countries,
}) => Data(  profileStatus: profileStatus ?? _profileStatus,
  role: role ?? _role,
  selectedCountry: selectedCountry ?? _selectedCountry,
  countries: countries ?? _countries,
);
  String? get profileStatus => _profileStatus;
  String? get role => _role;
  dynamic get selectedCountry => _selectedCountry;
  List<Countries>? get countries => _countries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_status'] = _profileStatus;
    map['role'] = _role;
    map['selected_country'] = _selectedCountry;
    if (_countries != null) {
      map['countries'] = _countries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Canada"
/// flag : "https://flagcdn.com/ca.svg"
/// image : "https://studylancer-bucket.blr1.cdn.digitaloceanspaces.com/system/canada.png"

class Countries {
  Countries({
      num? id, 
      String? name, 
      String? flag, 
      String? image,}){
    _id = id;
    _name = name;
    _flag = flag;
    _image = image;
}

  Countries.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _flag = json['flag'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _flag;
  String? _image;
Countries copyWith({  num? id,
  String? name,
  String? flag,
  String? image,
}) => Countries(  id: id ?? _id,
  name: name ?? _name,
  flag: flag ?? _flag,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get flag => _flag;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['flag'] = _flag;
    map['image'] = _image;
    return map;
  }

}