import 'dart:ui';

import 'package:dreader/common/localization/d_reader_string_en.dart';
import 'package:dreader/common/localization/d_reader_string_zh.dart';
import 'package:flutter/material.dart';

import 'd_reader_string_base.dart';

///自定义多语言实现
class DReaderLocalizations {
  final Locale locale;

  DReaderLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///DReaderStringEn和DReaderStringZh都继承了DReaderStringBase
  static Map<String, DReaderStringBase> _localizedValues = {
    'en': DReaderStringEn(),
    'zh': DReaderStringZh(),
  };

  DReaderStringBase get currentLocalized {
    if (_localizedValues.containsKey(locale.languageCode)) {
      return _localizedValues[locale.languageCode];
    }
    return _localizedValues["en"];
  }

  ///通过 Localizations 加载当前的 DReaderLocalizations
  ///获取对应的 DReaderStringBase
  static DReaderLocalizations of(BuildContext context) {
    return Localizations.of(context, DReaderLocalizations);
  }

  ///通过 Localizations 加载当前的 DReaderLocalizations
  ///获取对应的 DReaderStringBase
  static DReaderStringBase i18n(BuildContext context) {
    return of(context)
        .currentLocalized;
  }
}
