import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class LocaleController extends GetxController {
  void changeLanguage(String codeLanguage) {
    Locale locale = Locale(codeLanguage);
    Get.updateLocale(locale);
  }
}
