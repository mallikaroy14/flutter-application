import 'package:flutter/widgets.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get labelSelectLanguage;

  String get stringWelcomeBack;
  String get stringPleaseLogin;
  String get stringMobileNumber;
  String get stringUserName;
  String get stringLanguage;

}
