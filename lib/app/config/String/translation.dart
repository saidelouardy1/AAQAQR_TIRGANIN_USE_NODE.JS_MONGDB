import 'package:get/get.dart';

class StringApp implements Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "ar" : {
      "AAQAQIR_TIRGANIN" : "عقاقير تركانين",
      "What language do you prefer?" : "ما اللغة التي تفضلها؟",
      "Let’s use Arabic" : "دعنا نستخدم العربية",
      "Let’s use French" : "دعنا نستخدم الفرنسية",
      "Let’s use English" : "دعنا نستخدم الإنجليزية"
    },
    "en" : {
      "AAQAQIR_TIRGANIN" : "AAQAQIR_TIRGANIN",
      "What language do you prefer?" : "Quelle langue préférez-vous ?",
      "Let’s use Arabic" : "Let’s use Arabic",
      "Let’s use Arabic" : "Let’s use French",
      "Let’s use Arabic" : "Let’s use English",
    },
    "fr" : {
      "AAQAQIR_TIRGANIN" :  "AAQAQIR_TIRGANIN",
      "What language do you prefer?" : "Quelle langue préférez-vous ?",
      "Let’s use Arabic" : "Utilisons l’arabe",
      "Let’s use Arabic" : "Utilisons Français",
      "Let’s use Arabic" : "Utilisons English",
    }
  };
 
}

