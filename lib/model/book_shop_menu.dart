/// route_url : ""
/// title : "榜单"
/// icon : "static/img/bangdan.png"

class BookShopMenu {
  String _routeUrl;
  String _title;
  String _icon;

  String get routeUrl => _routeUrl;
  String get title => _title;
  String get icon => _icon;

  BookShopMenu(this._routeUrl, this._title, this._icon);

  BookShopMenu.map(dynamic obj) {
    this._routeUrl = obj["routeUrl"];
    this._title = obj["title"];
    this._icon = obj["icon"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["routeUrl"] = _routeUrl;
    map["title"] = _title;
    map["icon"] = _icon;
    return map;
  }

}