import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonH48 extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final bool isLoading;
  final Function function;
  final Color? color;
  final double width;
  final double minimumSize;

  const ButtonH48({
    super.key,
    required this.text,
    required this.isEnabled,
    this.isLoading = false,
    required this.function,
    this.color,
    this.width = 190,
    this.minimumSize = 190,
  });

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //     onTap: () {
    //       function();
    //     },
    //     child: Container(
    //       height: 48,
    //       width: 190,
    //       decoration: BoxDecoration(
    //         color: isEnabled
    //             ? Get.theme.colorScheme.primary
    //             : Get.theme.colorScheme.tertiary,
    //         borderRadius: const BorderRadius.all(Radius.circular(8)),
    //       ),
    //       child: Center(
    //           child: Text(
    //         text,
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 14,
    //         ),
    //       )),
    //     ));
    return ElevatedButton(
      onPressed: isEnabled && !isLoading
          ? () {
              function();
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        disabledBackgroundColor: Get.theme.colorScheme.shadow,
        minimumSize: Size(minimumSize, 50),
        maximumSize: Size(width, 50),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: TextStyle(
                  color:
                      isEnabled ? Colors.white : Get.theme.colorScheme.surface,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
      ),
    );
  }
}
