import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "HelloEveryOne": "Hello Every One",
          "app": "At a F_One4 Application"
        },
        "ar": {"HelloEveryOne": "مرحباً بكم جميعاً", "app": "F_One4 في تطبيق"},
        "fr": {
          "HelloEveryOne": "Bonjour à Tous",
          "app": "Lors D'une Application F_One4"
        },
        "de": {
          "HelloEveryOne": "Hallo Zusammen",
          "app": "Bei Einer F_One4-Anwendung"
        }
      };
}
