import 'package:dreader/common/localization/d_reader_localizations_delegate.dart';
import 'package:dreader/common/style/d_reader_style.dart';
import 'package:dreader/common/utils/common_utils.dart';
import 'package:dreader/common/utils/navigator_utils.dart';
import 'package:dreader/model/user.dart';
import 'package:dreader/page/error_page.dart';
import 'package:dreader/page/home_page.dart';
import 'package:dreader/page/splash_page.dart';
import 'package:dreader/redux/d_reader_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DReaderApp extends StatefulWidget {
  @override
  _DReaderState createState() {
    return _DReaderState();
  }
}

class _DReaderState extends State<DReaderApp> {
  final store = Store<DReaderState>(
    appReducer,
    initialState: DReaderState(
        userInfo: User.empty(),
        login: false,
        themeData: CommonUtils.getThemeData(DReaderColors.primarySwatch),
        locale: Locale('zh', 'CH')),
    middleware: middleware,
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new StoreBuilder<DReaderState>(builder: (context, store) {
        ///使用 StoreBuilder 获取 store 中的 theme 、locale
        store.state.platformLocale = WidgetsBinding.instance.window.locale;
        return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DReaderLocalizationsDelegate.delegate
          ],
          supportedLocales: [store.state.locale],
          locale: store.state.locale,
          theme: store.state.themeData,
          routes: {
            SplashPage.sName: (context) {
              return SplashPage();
            },
            HomePage.sName: (context) {
              return HomePage();
            },
          },
          initialRoute: SplashPage.sName,
          onUnknownRoute: (RouteSettings settings){
            return MaterialPageRoute(builder: (BuildContext context) {
              //如果当前路由页面不存在，则默认跳转404 页面
              String routeName = settings.name;
              print('路由页面:$routeName不存在');
              return ErrorPage();
            });
          },
        );
      }),
    );
  }
}
