import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locale/locale_controller.dart';

showLangDialog(BuildContext context) async {
  //Arabic Language
  Widget arabicOption = _dialogOptions(context, "Arabic", "ar");
  //English Language
  Widget englishOption = _dialogOptions(context, "English", "en");
  //French Language
  Widget frenchOption = _dialogOptions(context, "French", "fr");
  //English Language
  Widget germanOption = _dialogOptions(context, "German", "de");

  //Widget For Dialog Of Options
  var simpleDialog = SimpleDialog(
    title: const Text("Choose Language"),
    children: [arabicOption, englishOption, germanOption, frenchOption],
  );

  showDialog(
      context: context,
      builder: ((context) {
        return simpleDialog;
      }));
}

Widget _dialogOptions(BuildContext context, String title, String codeLanguage) {
  return SimpleDialogOption(
    onPressed: () {
      _onPressed(context, codeLanguage);
      Navigator.pop(context);
    },
    child: Text(
      title,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

_onPressed(BuildContext context, String langCode) async {
  var sp = await SharedPreferences.getInstance();
  LocaleController languageController = Get.find();
  languageController.changeLanguage(langCode);
  sp.setString("Language", langCode);
}
