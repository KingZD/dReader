/// route_url : ""
/// title : "榜单"
/// icon : "static/img/bangdan.png"

class Book {
  String _routeUrl;
  String _title;
  String _icon;
  String _desc;
  String _author;
  String _score;
  String _type;

  String get routeUrl => _routeUrl;
  String get title => _title;
  String get icon => _icon;
  String get desc => _desc;
  String get author => _author;
  String get score => _score;
  String get type => _type;

  Book(this._routeUrl, this._title, this._icon, this._desc, this._author,
      this._score, this._type);

  Book.map(dynamic obj) {
    this._routeUrl = obj["routeUrl"];
    this._title = obj["title"];
    this._icon = obj["icon"];
    this._desc = obj["desc"];
    this._author = obj["author"];
    this._score = obj["score"];
    this._type = obj["type"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["routeUrl"] = _routeUrl;
    map["title"] = _title;
    map["icon"] = _icon;
    map["desc"] = _desc;
    map["author"] = _author;
    map["score"] = _score;
    map["type"] = _type;
    return map;
  }
}
