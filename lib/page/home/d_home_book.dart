import 'package:dreader/model/home_scene.dart';
import 'package:dreader/widget/d_imge.dart';
import 'package:flutter/widgets.dart';

class DReaderHomeBook extends StatelessWidget {
  final DReaderHomeScene scene;

  const DReaderHomeBook({Key key, this.scene}) : super(key: key);

  buildRow() {
    return Row(
      children: <Widget>[
        DImage(
          width: 90,
          imageUrl: scene.book.icon,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                scene.book.title,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                scene.book.desc,
                style: TextStyle(fontSize: 16),
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    bool showTitle = scene.showBookTitle ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
