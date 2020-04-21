import 'package:dreader/model/user.dart';
import 'package:dreader/redux/locale_redux.dart';
import 'package:dreader/redux/login_redux.dart';
import 'package:dreader/redux/theme_redux.dart';
import 'package:dreader/redux/user_reducer.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'middleware/epic_middleware.dart';

class DReaderState {
  ///用户信息
  User userInfo;

  ///主题数据
  ThemeData themeData;

  ///语言
  Locale locale;

  ///当前手机平台默认语言
  Locale platformLocale;

  ///是否登录
  bool login;

  DReaderState(
      {this.userInfo,
      this.themeData,
      this.locale,
      this.platformLocale,
      this.login});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
DReaderState appReducer(DReaderState state, dynamic action) {
  return DReaderState(
    ///通过 UserReducer 将 DReaderState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),
    ///通过 ThemeDataReducer 将 DReaderState 内的 themeData 和 action 关联在一起
    themeData: ThemeDataReducer(state.themeData, action),
    ///通过 LocaleReducer 将 DReaderState 内的 locale 和 action 关联在一起
    locale: LocaleReducer(state.locale, action),
    login: LoginReducer(state.login, action),
  );
}

final List<Middleware<DReaderState>> middleware = [
  EpicMiddleware<DReaderState>(UserInfoEpic()),
  EpicMiddleware<DReaderState>(LoginEpic()),
  EpicMiddleware<DReaderState>(OAuthEpic()),
  UserInfoMiddleware(),
  LoginMiddleware(),
];
