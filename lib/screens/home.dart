import 'package:f_one4/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_one4/widget/language_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../locale/locale.dart';
import '../locale/locale_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => Appearances();
}

class Appearances extends State<HomeScreen> {
  var darkBool = false;

  //Init State
  @override
  void initState() {
    //Load Language
    _loadLanguage();
    //Load Appearance
    _loadAppearances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      //Languages Of Application
      locale: Get.deviceLocale,
      translations: MyLocale(),

      //Title Of Application
      title: "F_One4",

      //Themes Of Application
      theme: currentTheme(darkBool),
      home: Builder(builder: (context) {
        return Directionality(
          //Set Direction On LTR
          textDirection: TextDirection.ltr,
          child: Scaffold(
            //App Bar
            appBar: AppBar(
              title: const Text("F_One4"),
              actions: <Widget>[
                //Button Of Change Appearances Of Application
                IconButton(
                    onPressed: () async {
                      darkBool = !darkBool;
                      var sp = await SharedPreferences.getInstance();
                      sp.setBool("IsDark", darkBool);
                      setState(() {});
                    },
                    icon: Icon(currentIcon(darkBool))),

                //Button For Change Languages Of The Application
                IconButton(
                    onPressed: () {
                      showLangDialog(context);
                    },
                    icon: const Icon(Icons.language_sharp))
              ],
            ),

            //Body And Container
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _text("HelloEveryOne".tr, 27),
                  const SizedBox(height: 14),
                  _text("app".tr, 20)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  //Method For Text View
  Widget _text(String text, double textSize) {
    return Text(text, textAlign: TextAlign.center);
  }

  //Method For Load Language
  _loadLanguage() async {
    var sp = await SharedPreferences.getInstance();
    LocaleController languageController = Get.find();

    var language = sp.getString("Language") ?? "en";

    languageController.changeLanguage(language);
  }

  //Method For Load Appearances
  _loadAppearances() async {
    var sp = await SharedPreferences.getInstance();
    var isDarkEnabled = sp.getBool("IsDark");
    darkBool = isDarkEnabled ?? false;
  }
}
