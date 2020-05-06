import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/model/user.dart';
import 'package:dreader/redux/d_reader_state.dart';
import 'package:dreader/widget/d_imge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DReaderMeHeader extends StatefulWidget {
  @override
  _DReaderMeHeader createState() {
    return _DReaderMeHeader();
  }
}

class _DReaderMeHeader extends State<DReaderMeHeader> {
  _userLogin() {
    return StoreConnector<DReaderState, User>(
      builder: (BuildContext context, User userInfo) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            DImage(
              imageUrl: (userInfo.isLogin())
                  ? "https://pic3.zhimg.com/80/v2-472dd0a3c1c6ace9a992f2edca668cbf_1440w.jpg"
                  : "personal__shared__avatar_middle.png",
              width: 50,
              height: 50,
              borderRadius: 50,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "${userInfo.userName ?? "请登录"}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            (userInfo.isLogin())
                ? IconButton(
                    icon: Image.asset(
                        "static/img/personal__main__header_account_view_edit_icon.png"),
                    onPressed: () {},
                  )
                : SizedBox(),
          ],
        );
      },
      converter: (store) {
        return store.state.userInfo;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("static/img/personal__main__header_view_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              _userLogin(),
              Container(
                height: 85,
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text("书币"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text("书豆"),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text("优惠券"),
                      ],
                    ),
                    SizedBox(
                      height: double.infinity,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              SizedBox(
                                child: Image.asset(
                                  "static/img/personal__main__header_tooltip_bg.9.png",
                                  fit: BoxFit.fill,
                                ),
                                width: 140,
                                height: 60,
                              ),
                              Positioned(
                                child: Text("首冲返100书币~",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: DReaderColors.mainThemeColor)),
                                top: 8,
                              ),
                            ],
                          ),
                          Positioned(
                            child: RaisedButton(
                              child: Text(
                                "充值",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              color: DReaderColors.mainThemeColor,
                            ),
                            top: 40,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Image.asset(
                        "static/img/personal__main__header_vip_card.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("立即开通，万本好书免费读"),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "static/img/personal__main__header_vip_tip_exit_icon.png",
                          width: 10,
                          height: 10,
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 20, right: 20),
              ),
            ],
          ),
        ),
      ),
      width: double.infinity,
    );
  }
}
