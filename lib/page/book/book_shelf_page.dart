import 'package:dreader/common/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookShelfPage extends StatefulWidget {
  @override
  _BookShelfPage createState() {
    return _BookShelfPage();
  }
}

class _BookShelfPage extends State<BookShelfPage> {
  ScrollController scrollController = ScrollController();

  header(innerBoxIsScrolled) {
    return Stack(
      children: <Widget>[
        SizedBox(
          child: Image.asset(
              "static/img/bookshelf__bookshelf_view__background.png"),
          width: CommonUtils.screenSize(context).width,
        ),
        SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "阅读时长"),
                  TextSpan(text: "1159", style: TextStyle(fontSize: 18)),
                  TextSpan(text: "小时")
                ])),
              ),
              Icon(Icons.search),
              Icon(Icons.menu),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NestedScrollView(
          physics: BouncingScrollPhysics(),
          controller: scrollController,
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.green,
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                          "static/img/general__shared__book_category_book_shadow.9.png"),
                      Image.asset(
                          "static/img/general__shared__book_list_shadow.9.png"),
                    ],
                  ),
                ),
              );
            },
            itemCount: 30,
            physics: BouncingScrollPhysics(),
          ),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset(
                                "static/img/bookshelf__bookshelf_view__background.png"),
                            width: CommonUtils.screenSize(context).width,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      Positioned(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "阅读时长", style: TextStyle(fontSize: 16)),
                          TextSpan(
                            text: "1159",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(text: "小时", style: TextStyle(fontSize: 16))
                        ])),
                        bottom: 90,
                        left: 12,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: <Widget>[
                          Image.asset(
                              "static/img/bookshelf__bookshelf_pull_down_view__single_bg.png"),
                          Positioned(
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  child: Image.asset(
                                      "static/img/bookshelf__sign_in_view__sign_pic.png"),
                                  width: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "福利免费送~福利免费送~福利免费送~福利免费送~",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  child: Image.asset(
                                      "static/img/store__feed_vip__status_arrow.png"),
                                  width: 15,
                                ),
                              ],
                            ),
                            left: 30,
                            right: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  color: Colors.blue,
                ),
              ),
            ];
          },
        ),
        Stack(
          children: <Widget>[
            SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.transparent),
              ),
              height: 90,
              width: double.infinity,
            ),
            SafeArea(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: 0,
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: "阅读时长", style: TextStyle(fontSize: 16)),
                          TextSpan(
                            text: "1159",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(text: "小时", style: TextStyle(fontSize: 16))
                        ]),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: SizedBox(
                      child: Image.asset(
                          "static/img/bookshelf__bookshelf_tab_view__search_icon.png"),
                      width: 15,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SizedBox(
                      child: Image.asset(
                          "static/img/bookshelf__bookshelf_tab_view__menu.png"),
                      width: 15,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
