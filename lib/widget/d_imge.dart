import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final String placeHolder;
  final double borderRadius;
  final BoxFit fit;

  const DImage(
      {Key key,
      this.width,
      this.height,
      @required this.imageUrl,
      this.placeHolder,
      this.fit,
      this.borderRadius})
      : super(key: key);

  Widget getImage() {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.fill,
      placeholder: (BuildContext context, String url) {
        return Image.asset(
          placeHolder ??
              "static/img/general__shared__book_category_book_shadow.9.png",
          width: width,
          height: height,
        );
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (borderRadius != null && borderRadius > 0)
        ? ClipRRect(
            child: getImage(),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)))
        : getImage();
  }
}
