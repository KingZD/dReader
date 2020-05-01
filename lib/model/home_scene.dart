import 'package:dreader/model/book.dart';

import 'book_shop_menu.dart';

enum SceneEnum {
  ///头图
  BANNER,

  ///搜索框
  SEARCH,

  ///分类菜单
  MENU,

  ///推荐栏目
  RECOMMEND,

  ///通用列表
  LIST
}

class DReaderHomeScene {
  final SceneEnum scene;
  final List<BookShopMenu> bookMenu;
  final List<BookShopMenu> bookRecommend;
  final Book book;
  final List<String> banner;
  final bool showBookTitle;

  DReaderHomeScene(this.scene,
      {this.bookMenu, this.bookRecommend, this.book, this.banner, this.showBookTitle});
}
