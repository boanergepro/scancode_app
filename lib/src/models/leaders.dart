class Leaders{
  String _name;
  String _username;
  String _avatarUrl;
  String _location;
  Map<String,dynamic> _experience;
  String _total;
  String _countryCode;

  // Constructor
  Leaders.fromJson(Map<String, dynamic> json){
    _name = json['name'] ?? '';
    _username = json['login'] ?? '';
    _avatarUrl = json['avatarUrl'] ?? '';
    _location = json['location'] ?? '';
    _experience = Map<String, dynamic>.from(json['experience']);
    _total = json['total'] ?? '';
    _countryCode = json['countryCode'] ?? '';
  }

  // Getter
  String get name => _name;
  String get username => _username;
  String get avatarUrl => _avatarUrl;
  String get location => _location;
  Map<String, dynamic> get experience => _experience;
  String get total => _total;
  String get countryCode => _countryCode;


}