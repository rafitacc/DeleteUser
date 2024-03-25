import 'package:delete_user_web/src/services/services.dart';
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
        title: 'Estas seguro de eliminar este usario?',
        middleText:
            'Al precionar ok se borraran todos los datos asociados a este usario.',
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
      case "Dirección de correo electrónico":
        {
          return (value == null ||
                  value.isEmpty ||
                  !value.contains('@') ||
                  !value.contains('.'))
              ? 'Ingrese un correo electrónico válido'
              : null;
        }
      case "Contraseña2":
        {
          return value!.isEmpty ||
                  value.length <= 7 ||
                  !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])').hasMatch(value)
              ? 'La contraseña debe tener al menos una letra mayúscula,\n una minúscula y al menos 8 caracteres.'
              : null;
        }
      default:
        return null;
    }
  }
}
