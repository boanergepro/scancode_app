class Repository {
  String _fullName;
  String _source;
  int _commentCoverage;
  int _starCount;
  int _activeMonthCount;
  String _imageUrl;
  int _commitCount;
  int _contributorCount;
  int _familiarity;
  int _contributorActiveMonthCount;
  List<Map<String, dynamic>> _languages;
  bool _private;

  // Constructor
  Repository.fromJson(Map<String, dynamic> json) {
    _fullName = json['fullName'] ?? '';
    _source = json['source'] ?? '';
    _commentCoverage = json['commentCoverage'] ?? 0;
    _starCount = json['starCount'] ?? 0;
    _activeMonthCount = json['activeMonthCount'] ?? 0;
    _imageUrl = json['imageUrl'] ?? '';
    _commitCount = json['commitCount'] ?? 0;
    _contributorCount = json['contributorCount'] ?? 0;
    _familiarity = json['familiarity'] ?? 0;
    _contributorActiveMonthCount = json['contributorActiveMonthCount'] ?? 0;
    _languages = List<Map<String, dynamic>>.from(json['languages']);
    _private = json['private'] ?? false;
  }

  // Getter
  String get fullName => _fullName;
  String get source => _source;
  int get commentCoverage => _commentCoverage;
  int get starCount => _starCount;
  int get activeMonthCount => _activeMonthCount;
  String get imageUrl => _imageUrl;
  int get commitCount => _commitCount;
  int get contributorCount => _contributorCount;
  int get familiarity => _familiarity;
  int get contributorActiveMonthCount => _contributorActiveMonthCount;
  List<Map<String, dynamic>> get languages => _languages;
  bool get private => _private;
}