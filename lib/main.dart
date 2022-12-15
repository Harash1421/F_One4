import 'package:f_one4/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'locale/locale_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //GetX Put Locale Languages Controller
  Get.put(LocaleController());
  //Run Application
  runApp(const HomeScreen());
}
