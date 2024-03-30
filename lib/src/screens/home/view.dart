// ignore_for_file: must_be_immutable

import 'package:delete_user_web/src/constants/asset_paths.dart';
import 'package:delete_user_web/src/screens/home/controller.dart';
import 'package:delete_user_web/src/widgets/buttonh48.dart';
import 'package:delete_user_web/src/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetResponsiveView<RecoverController> {
  Home({super.key});
  @override
  var controller = Get.put(RecoverController());

  @override
  Widget builder() {
    return Scaffold(
      appBar: GetPlatform.isWeb
          ? null
          : AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Get.theme.colorScheme.primaryContainer),
      backgroundColor: Colors.white,
      body: Obx(() => _display()),
    );
  }

  Widget _display() {
    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            // color: Colors.red,
            width: screen.responsiveValue(
              desktop: screen.width * 0.5,
              tablet: screen.width,
              mobile: screen.width,
            ),
            height: Get.height,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Center(
                    child: SizedBox(
                      width: screen.responsiveValue(
                        desktop: 500,
                        tablet: 500,
                        mobile: screen.width,
                      ),
                      child: _body(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  _image(image, {double width = 200}) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: width,
            ),
          ],
        ),
        const SizedBox(height: 30)
      ],
    );
  }

  _body() {
    switch (controller.numberPage.value) {
      case 0:
        return _page0();
      case 1:
        return _page1();
      default:
        return _page0();
    }
  }

  _page0() {
    return Form(
      key: controller.formkey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: GetPlatform.isMobile ? 50 : Get.height * 0.15),
          SizedBox(
            width: 300,
            height: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _image(AssetPath.logo1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      'home_1'.tr,
                      style: Get.theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'home_2'.tr,
            style: Get.theme.textTheme.titleMedium!
                .copyWith(color: Get.theme.colorScheme.surface),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    controller.dialogLanguage();
                  },
                  child: Icon(
                    Icons.translate,
                    color: Colors.white,
                  )),
            ],
          ),
          //   SizedBox(height: Get.height * 0.02),
          InputText(
            name: 'home_3'.tr,
            textController: controller.emailC.value,
            controller: controller,
            onChanged: () => controller.enabledButton(),
          ),
          const SizedBox(height: 30),
          InputText(
            name: 'home_4'.tr,
            textController: controller.passwordC.value,
            controller: controller,
            onChanged: () => controller.enabledButton(),
            obscureText: true,
          ),
          SizedBox(height: Get.height * 0.04),
          _buttonNext(
            controller.formkey,
            width: screen.responsiveValue(
              desktop: 460,
              tablet: 460,
              mobile: screen.width - 40,
            ),
            text: 'home_5'.tr,
          ),
          SizedBox(height: Get.height * 0.03),
        ],
      ),
    );
  }

  _page1() {
    return Form(
      key: controller.formkey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: Get.height * 0.15),
          SizedBox(
            width: 300,
            height: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _image(AssetPath.logo1),
                // _image(AssetPath.succesful, width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      'home_6'.tr,
                      style: Get.theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'home_7'.tr,
            style: Get.theme.textTheme.titleMedium!
                .copyWith(color: Get.theme.colorScheme.surface),
          ),
        ],
      ),
    );
  }

  Widget _buttonNext(formkeyx, {String text = "Siguiente", width = 190}) {
    return Obx(() => Row(
          children: [
            ButtonH48(
              width: width,
              text: text,
              isEnabled: true,
              isLoading: controller.isLoading.value,
              function: () {
                controller.pressButton(formkeyx);
              },
            ),
          ],
        ));
  }
}
