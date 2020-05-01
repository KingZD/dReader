import 'package:carousel_slider/carousel_slider.dart';
import 'package:dreader/widget/d_imge.dart';
import 'package:flutter/widgets.dart';

class DReaderBanner extends StatelessWidget {
  final List<String> banner;

  const DReaderBanner({Key key, @required this.banner})
      : assert(banner != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banner
          .map((banner) => DImage(
                imageUrl: banner,
                borderRadius: 10,
              ))
          .toList(),
      options: CarouselOptions(viewportFraction: 1.0, autoPlay: true),
    );
  }
}
