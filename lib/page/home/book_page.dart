import 'package:dreader/model/book.dart';
import 'package:dreader/model/book_shop_menu.dart';
import 'package:dreader/model/home_scene.dart';
import 'package:dreader/page/home/d_home_banner.dart';
import 'package:dreader/page/home/d_home_book.dart';
import 'package:dreader/page/home/d_home_recommend.dart';
import 'package:dreader/page/home/d_reader_menu.dart';
import 'package:dreader/widget/bookshop/d_reader_search_button.dart';
import 'package:dreader/widget/d_imge.dart';
import 'package:dreader/widget/d_reader_space_widget.dart';
import 'package:dreader/widget/tabber/d_reader_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ScrollDirect {
  ///向左滑动
  LEFT,

  ///向右滑动
  RIGHT,

  /// 停止
  AIDL
}

/**
 * Author: zed
 * Date: 2020/4/23 11:37
 * Description: 书城
 */
class BookPage extends StatefulWidget {
  const BookPage({Key key}) : super(key: key);

  @override
  _HomePage createState() {
    return _HomePage();
  }
}

class _HomePage extends State<BookPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<DReaderHomeScene> homeScene = [];
  final _title = [
    "精选",
    "男生",
    "女生",
    "图书",
    "听书",
    "漫画",
    "VIP",
  ];

  final _menu = [
    BookShopMenu("", "榜单", "static/img/bangdan.png"),
    BookShopMenu("", "完本", "static/img/book_complete.png"),
    BookShopMenu("", "新书", "static/img/book_new.png"),
    BookShopMenu("", "精选", "static/img/book_chioce.png"),
    BookShopMenu("", "书单", "static/img/book_list.png"),
  ];

  final _recommend = [
    BookShopMenu("", "斗罗大陆",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01iHinAVKxh/LvskRCjyPy3bS3.jpg!l"),
    BookShopMenu("", "斗罗大陆外传：神界传说（全集）",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01r0xcGw6F9/g5aALVM5js6v5j.jpg!l"),
    BookShopMenu("", "斗破苍穹（全集）",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p010s07xjt4t/MmSF93H0dwqC1b.jpg!l"),
    BookShopMenu("", "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l"),
  ];

  final _book = [
    Book(
        "",
        "斗罗大陆",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01iHinAVKxh/LvskRCjyPy3bS3.jpg!l",
        "唐门外门弟子唐三，因偷学内门绝学为唐门所不容，跳崖明志时却发现没有死，反而以另外一个身份来到了另一个世界，一个属于武魂的世界，名叫斗罗大陆。这里没有魔法，没有斗气，没有武术，却有神奇的武魂",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "斗罗大陆外传：神界传说（全集）",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01r0xcGw6F9/g5aALVM5js6v5j.jpg!l",
        "这是属于我们唐门的世界，一个个你们所熟悉的唐门英雄会在这场众神之战的大舞台中登场。还记得光之子中的长弓威、狂神雷翔、死神阿呆、仙帝海龙、",
        "栗子2",
        "9.6",
        "异世大陆"),
    Book(
        "",
        "斗破苍穹（全集）",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p010s07xjt4t/MmSF93H0dwqC1b.jpg!l",
        "",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l",
        "",
        "清梦",
        "9.7",
        "宫斗"),
  ];

  final _banner = [
    "http:\/\/img-tailor.11222.cn\/pm\/book\/operate\/2019011021053421.jpg",
    "http:\/\/img-tailor.11222.cn\/pm\/book\/operate\/2019011021054677.jpg",
    "http:\/\/img-tailor.11222.cn\/pm\/book\/operate\/2019010722535762.jpg",
    "http:\/\/img-tailor.11222.cn\/pm\/book\/operate\/2019010221243959.jpg"
  ];

  @override
  void initState() {
    super.initState();
    loadPage();
  }

  loadPage() async {
    homeScene.add(DReaderHomeScene(SceneEnum.SEARCH));
    homeScene.add(DReaderHomeScene(SceneEnum.BANNER, banner: _banner));
    homeScene.add(DReaderHomeScene(SceneEnum.MENU, bookMenu: _menu));
    homeScene
        .add(DReaderHomeScene(SceneEnum.RECOMMEND, bookRecommend: _recommend));
    _book.forEach((book) {
      homeScene.add(DReaderHomeScene(SceneEnum.LIST,
          book: book, showBookTitle: _book.indexOf(book) == 0));
    });
    setState(() {});
  }

  ///这里处理方式是 每个page有几个模块组成，分别对应不同显示的模块
  ///也可以使用枚举梳理
  Widget getItem(int index) {
    DReaderHomeScene scene = homeScene[index];
    switch (scene.scene) {
      case SceneEnum.BANNER:
        return DReaderSpaceWidget(
          height: 10,
          child: DReaderBanner(banner: scene.banner),
        );
      case SceneEnum.SEARCH:
        return DReaderSpaceWidget(
          height: 10,
          child: DReaderSearchWidget(),
        );
      case SceneEnum.MENU:
        return DReaderSpaceWidget(
          height: 10,
          child: DReaderMenuWidget(
            menus: scene.bookMenu,
          ),
        );
      case SceneEnum.RECOMMEND:
        return DReaderRecommend(
          height: 20,
          recommend: scene.bookRecommend,
        );
      case SceneEnum.LIST:
        return DReaderHomeBook(
          scene: scene,
        );
    }
    return DReaderHomeBook(
      scene: scene,
    );
  }

  Widget getPageBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return getItem(index);
      },
      itemCount: homeScene.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              DReaderTabViewInheritedWidget(
                tabs: _title,
                child: DReaderTabView(),
              ),
              Expanded(
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: PageController(),
                  children: _title.map((item) => getPageBody()).toList(),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
