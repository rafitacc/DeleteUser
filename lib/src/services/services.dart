// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Service {
  Future<bool> delete(email, password) async {
    // Obtener el usuario actual
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user!;

      Get.snackbar(
        user.email!,
        user.displayName!,
        backgroundColor: Colors.green,
      );
      // await user.delete();
      return true;
    } catch (e) {
      print(e);
      inspect(e);

      Get.snackbar(e.toString(), e.toString(),
          duration: const Duration(seconds: 6));

      return false;
    }
  }
}
