import 'package:beauty_salon/src/MainWidgets/defaultAppbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'generated/assets.dart';
import 'generated/locale_keys.g.dart';
import 'item_language.dart';

final supportedLocales = <Locale>[
  Locale('en'),
  Locale('ar'),
];

Widget getCurrentLanguageFlag(BuildContext context,
    {double flagHeight = 11.5}) {
  return context.locale.languageCode == supportedLocales[1].languageCode
      ? Image.asset(Assets.imagesFlagAr, height: flagHeight)
      : Image.asset(
          Assets.imagesFlagEn,
          height: flagHeight,
        );
}

class LanguageScreen extends StatefulWidget {
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final String tag = 'LanguageScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultSimpleAppBar(title: tr("app language"), context: context
          // isBackButtonExist: true,
          ),
      body: ListView(
        children: [
          ItemLanguage(
              name: tr(LocaleKeys.english),
              value: supportedLocales[0].languageCode,
              groupValue: EasyLocalization.of(context)!.locale.languageCode,
              onChanged: onLanguageSelected),
          ItemLanguage(
              name: tr(LocaleKeys.arabic),
              value: supportedLocales[1].languageCode,
              groupValue: EasyLocalization.of(context)!.locale.languageCode,
              onChanged: onLanguageSelected),
        ],
      ),
    );
  }

  void onLanguageSelected(String languageCode, BuildContext context) {
    // LocaleKeys.changing_language.tr();
    context.locale = Locale(languageCode);
    Navigator.pop(context);
  }
}
