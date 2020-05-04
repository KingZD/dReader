import 'package:dreader/widget/d_imge.dart';
import 'package:flutter/material.dart';

class DReaderMeActivity extends StatefulWidget {
  @override
  _DReaderMeActivity createState() {
    return _DReaderMeActivity();
  }
}

class _DReaderMeActivity extends State<DReaderMeActivity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "福利活动",
                style: TextStyle(fontSize: 20),
              ),
              flex: 1,
            ),
            Text("查看全部"),
            Image.asset(
              "static/img/bookshelf__path_gallery_item_bg.9.png",
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: DImage(
                imageUrl:
                    "http:\/\/img-tailor.11222.cn\/pm\/book\/operate\/2019011021053421.jpg",
                borderRadius: 10,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: DImage(
                imageUrl:
                    "http:\/\/img-tailor.11222.cn\/pm\/book\/operate\/2019011021054677.jpg",
                borderRadius: 10,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }
}
