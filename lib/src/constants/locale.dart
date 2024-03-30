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

const Map<String, String> ukUS = {
  'home_1': 'Видалити користувача',
  'home_2': 'Введіть свою електронну адресу, щоб видалити всі ваші дані',
  'home_3': 'Адреса електронної пошти',
  'home_4': 'Пароль',
  'home_5': 'Далі',
  'home_6': 'Підтверджена електронна адреса',
  'home_7': 'Вашого користувача успішно видалено.',
  'controller_home_1': 'Ви впевнені, що хочете видалити цього користувача?',
  'controller_home_2':
      'Натиснувши «ОК», ви видалите всі дані, пов’язані з цим користувачем.',
  'controller_home_3': 'Ви впевнені, що хочете видалити цього користувача?',
  'controller_home_4': 'Введіть дійсну адресу електронної пошти',
  'controller_home_5': 'Пароль має містити принаймні один символ.',
  'controller_home_6': 'Виберіть мову',
};

class LocalizationService extends Translations {
  static final locale = UserPreferences().language == 'English'
      ? Locale('en')
      : UserPreferences().language == 'Español'
          ? Locale('es')
          : Locale('uk');

  static final fallbackLocale = UserPreferences().language != 'English'
      ? Locale('en')
      : UserPreferences().language == 'Español'
          ? Locale('es')
          : Locale('uk');

  static final langs = ['English', 'Español', 'Yкраїнська'];

  static final locales = [
    const Locale('en'),
    const Locale('es'),
    const Locale('uk'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'es_US': esUS,
        'uk_US': ukUS,
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
