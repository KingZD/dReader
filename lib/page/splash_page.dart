import 'package:dreader/common/localization/default_localizations.dart';
import 'package:dreader/common/style/d_reader_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String sName = "SplashPage";

  @override
  _SPlashPage createState() {
    // TODO: implement createState
    return _SPlashPage();
  }
}

class _SPlashPage extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: DReaderColors.cardWhite,
        ),
        child: Center(
          child: Text(
            DReaderLocalizations.i18n(context).welcomeMessage,
            style: DReaderConstant.normalText,
          ),
        ),
      ),
    );
  }
}
