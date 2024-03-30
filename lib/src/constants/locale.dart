// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:delete_user_web/src/shared_preferens/user_preferens.dart';
import 'package:get/get.dart';

const Map<String, String> enUS = {
  'home_1': 'Delete user',
  'home_2': 'Enter your email to delete all your data',
  'home_3': 'Email address',
  'home_4': 'Password',
  'home_5': 'Next',
  'home_6': 'Verified email',
  'home_7': 'Your user has been successfully deleted.',
  'controller_home_1': 'Are you sure to delete this user?',
  'controller_home_2':
      'Pressing ok will delete all data associated with this user.',
  'controller_home_3': 'Are you sure to delete this user?',
  'controller_home_4': 'Enter a valid email address',
  'controller_home_5': 'The password must be at least one character.',
  'controller_home_6': 'Select a language',
};
const Map<String, String> esUS = {
  'home_1': 'Eliminar usario ',
  'home_2': 'Introduzca su correo electrónico para eliminar todos sus datos',
  'home_3': 'Dirección de correo electrónico',
  'home_4': 'Contraseña',
  'home_5': 'Siguiente',
  'home_6': 'Correo electrónico verificado',
  'home_7': 'Su usario a sido eliminado con éxito.',
  'controller_home_1': '¿Estás seguro de eliminar este usuario?',
  'controller_home_2':
      'Al presionar ok se borrarán todos los datos asociados a este usario.',
  'controller_home_3': '¿Estás seguro de eliminar este usuario?',
  'controller_home_4': 'Ingrese una dirección de correo electrónico válida',
  'controller_home_5': 'La contraseña debe tener al menos un carácter.',
  'controller_home_6': 'Selecciona un idioma',
};

class LocalizationService extends Translations {
  static final locale =
      UserPreferences().language == 'English' ? Locale('en') : Locale('es');

  static final fallbackLocale =
      UserPreferences().language != 'English' ? Locale('en') : Locale('es');

  static final langs = [
    'English',
    'Spanish',
  ];

  static final locales = [
    const Locale('en'),
    const Locale('es'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'es_US': esUS,
      };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
