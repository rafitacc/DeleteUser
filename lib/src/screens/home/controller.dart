import 'package:delete_user_web/src/constants/locale.dart';
import 'package:delete_user_web/src/services/services.dart';
import 'package:delete_user_web/src/shared_preferens/user_preferens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverController extends GetxController {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailC = TextEditingController(text: '').obs;
  var passwordC = TextEditingController(text: '').obs;
  RxBool isLoading = false.obs;
  RxInt numberPage = 0.obs;

  bool enabledButton() {
    bool isEnabled = false;
    if (emailC.value.text.isNotEmpty) isEnabled = true;
    return isEnabled;
  }

  dialog() {
    Get.defaultDialog(
        title: 'controller_home_1'.tr,
        middleText: 'controller_home_2'.tr,
        onConfirm: () async {
          Get.back();
          final resp =
              await Service().delete(emailC.value.text, passwordC.value.text);

          resp ? numberPage += 1 : null;
          isLoading.value = false;
        },
        onCancel: () {
          isLoading.value = true;
          Get.back();
        });
  }

  pressButton(GlobalKey<FormState> formkey) {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!formkey.currentState!.validate()) return;
    isLoading.value = true;
    dialog();
  }

  String? validator(String name, String? value) {
    switch (name) {
      case 'Email address':
      case "Dirección de correo electrónico":
        {
          return (value == null ||
                  value.isEmpty ||
                  !value.contains('@') ||
                  !value.contains('.'))
              ? 'controller_home_4'.tr
              : null;
        }
      case 'Password':
      case 'Contraseña':
        {
          return value!.isEmpty ? 'controller_home_5'.tr : null;
        }
      default:
        return null;
    }
  }

  dialogLanguage() {
    Get.defaultDialog(
        title: 'controller_home_6'.tr,
        content: Column(
          children: [
            _selectLangueX(type: 0),
            _selectLangueX(type: 1),
          ],
        ));
  }

  Widget _selectLangueX({required int type}) {
    final _prefs = UserPreferences();
    late String _selectedLang;
    _selectedLang = _prefs.language;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _selectedLang == LocalizationService.langs[type]
            ? Colors.black
            : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border:
            Border.all(width: 1, color: Theme.of(Get.context!).disabledColor),
      ),
      child: ListTile(
        onTap: () {
          LocalizationService().changeLocale(LocalizationService.langs[type]);
          _selectedLang = LocalizationService.langs[type];
          _prefs.language = LocalizationService.langs[type];
          Get.back();
        },
        leading: Icon(Icons.language,
            color: _selectedLang == LocalizationService.langs[type]
                ? Get.theme.colorScheme.primary
                : Get.theme.disabledColor),
        title: Text(
          type == 0 ? 'english'.tr : 'spanish'.tr,
          style: TextStyle(
              fontWeight: _selectedLang == LocalizationService.langs[type]
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: _selectedLang == LocalizationService.langs[type]
                  ? Colors.white
                  : Colors.black),
        ),
        trailing: _selectedLang == LocalizationService.langs[type]
            ? Icon(
                Icons.check,
                color: Get.theme.colorScheme.primary,
                size: 35,
              )
            : const SizedBox(),
      ),
    );
  }
}
