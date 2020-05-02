import 'package:dreader/model/book.dart';
import 'package:dreader/model/home_scene.dart';
import 'package:dreader/page/home/d_home_book.dart';
import 'package:dreader/widget/tabber/d_reader_tab_view.dart';
import 'package:flutter/material.dart';

class TypePage extends StatefulWidget {
  @override
  _TypePage createState() {
    return _TypePage();
  }
}

class _TypePage extends State<TypePage> {
  final _title = [
    "男生",
    "女生",
    "图书",
    "听书",
    "漫画",
  ];

  final _typeMenu = [
    "都市",
    "玄幻",
    "历史",
    "仙侠",
    "科幻",
    "游戏",
    "职场",
    "武侠",
    "奇幻",
    "灵异",
    "军事",
    "短篇",
    "竞技",
    "同人",
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
        "斗破苍穹（全集）",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l",
        "三千鸦杀",
        "清梦",
        "9.7",
        "宫斗"),
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
        "斗破苍穹（全集）",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l",
        "三千鸦杀",
        "清梦",
        "9.7",
        "宫斗"),
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
        "斗破苍穹（全集）",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l",
        "三千鸦杀",
        "清梦",
        "9.7",
        "宫斗"),
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
        "斗破苍穹（全集）",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l",
        "三千鸦杀",
        "清梦",
        "9.7",
        "宫斗"),
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
        "斗破苍穹（全集）",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l",
        "三千鸦杀",
        "清梦",
        "9.7",
        "宫斗"),
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
        "斗破苍穹（全集）",
        "栗子",
        "10",
        "异世大陆"),
    Book(
        "",
        "三千鸦杀",
        "http://cover.read.duokan.com/mfsv2/download/fdsc3/p01XuRsvWxIe/UvhKmMjZCmn5G6.jpg!l",
        "三千鸦杀",
        "清梦",
        "9.7",
        "宫斗"),
  ];

  List<DReaderHomeScene> bookScene = [];

  @override
  void initState() {
    super.initState();
    loadPage();
  }

  loadPage() async {
    _book.forEach((book) {
      bookScene.add(DReaderHomeScene(SceneEnum.LIST,
          book: book, showBookTitle: _book.indexOf(book) == 0));
    });
    setState(() {});
  }

  leftMenu() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        print("构建type类目");
        return SizedBox(
          child: RaisedButton(
            onPressed: () {},
            child: Text(
              _typeMenu[index],
            ),
          ),
          height: 80,
        );
      },
      itemCount: _typeMenu.length,
    );
  }

  rightBook() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        print("构建book");
        return DReaderHomeBook(
          scene: bookScene[index],
        );
      },
      itemCount: bookScene.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 0, left: 0, right: 12),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0, left: 12, right: 0),
              child: DReaderTabView(
                tabs: _title,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: leftMenu(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: rightBook(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
