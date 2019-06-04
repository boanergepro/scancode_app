class User {
  String _name;
  String _username;
  String _avatarUrl;
  String _email;
  String _company;
  String _location;
  String _url;
  String _biography;
  Map<String, int> _experience;
  int _realRepositoryCount;
  List<Map<String, dynamic>> _languages;
  int _activeMonthCount;
  List<Map<String, String>> _externalOrganizations;
  String _jobTitle;

  // Constructor
  User.fromJson(Map<String, dynamic> json) {
    _name = json['name'] ?? '';
    _username = json['login'] ?? '';
    _avatarUrl = json['avatarUrl'] ?? '';
    _email = json['email'] ?? '';
    _company = json['company'] ?? '';
    _location = json['location'] ?? '';
    _url = json['url'] ?? '';
    _biography = json['biography'] ?? '';
    _experience = json['experience'] ?? '';
    _realRepositoryCount = json['realRepositoryCount'] ?? '';
    _languages = json['languages'] ?? '';
    _activeMonthCount = json['activeMonthCount'] ?? '';
    _externalOrganizations = json['externalOrganizations'] ?? '';
    _jobTitle = json['jobTitle'] ?? '';
  }

  // Getter
  String get name => _name;
  String get username => _username;
  String get avatarUrl => _avatarUrl;
  String get email => _email;
  String get company => _company;
  String get location => _location;
  String get url => _url;
  String get biography => _biography;
  Map<String, int> get experience => _experience;
  String get level => _getLevel();
  int get repositoryCount => _realRepositoryCount;
  List<Map<String, dynamic>> get languages => _languages;
  int get activeMonthCount => _activeMonthCount;
  List<Map<String, String>> get externalOrganizations => _externalOrganizations;
  String get jobTitle => _jobTitle;

  //Methods
  String _getLevel() {
    int _total = _experience['total'];
    if (_total < 200) {
      return 'Novice';
    } else if (_total >= 200 && _total < 400) {
      return 'Recruit';
    } else if (_total >= 400 && _total < 800) {
      return 'Pathfinder';
    } else if (_total >= 800 && _total < 1600) {
      return 'Ranger';
    } else if (_total >= 1600 && _total < 3200) {
      return 'Knight';
    } else if (_total >= 3200 && _total < 6400) {
      return 'King';
    } else if (_total >= 6400) {
      return 'Sage';
    } else {
      return '';
    }
  }
}