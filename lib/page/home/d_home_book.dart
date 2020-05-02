import 'package:dreader/model/home_scene.dart';
import 'package:dreader/widget/d_imge.dart';
import 'package:flutter/widgets.dart';

class DReaderHomeBook extends StatelessWidget {
  final DReaderHomeScene scene;

  const DReaderHomeBook({Key key, this.scene}) : super(key: key);

  buildRow() {
    return Container(
      constraints: BoxConstraints(maxHeight: 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //子组件的排列方式为主轴两端对齐
        children: <Widget>[
          Expanded(
            child: DImage(
              imageUrl: scene.book.icon,
            ),
            flex: 1,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      scene.book.title,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      scene.book.desc,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(scene.book.author),
                    ),
                    Text(scene.book.type),
                    Text("${scene.book.score}分"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool showTitle = scene.showBookTitle ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        showTitle
            ? Text(
                "小编推荐",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            : Container(),
        SizedBox(
          height: showTitle ? 10 : 0,
        ),
        buildRow(),
      ],
    );
  }
}
