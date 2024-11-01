import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moobile_vault_user/models/user/user.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart'; // Ensure this import is correct

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNUmberCtrl = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSend;

  @override
  void onInit() {
    super.onInit();
    userCollection = firestore.collection('users');
  }

  void addUser() {
    try {
      DocumentReference doc = userCollection.doc();
      User user = User(
        id: doc.id,
        name: registerNameCtrl.text,
        number: int.parse(registerNUmberCtrl.text),
      );

      final userJson = user.toJson(); // Ensure this line is correct
      doc.set(userJson).then((_) {
        Get.snackbar('Success', 'User added successfully',
            colorText: Colors.green);
      }).catchError((error) {
        Get.snackbar('Error', 'Failed to add user: $error',
            colorText: Colors.red);
      });
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  sendOtp() {
    try {
      if (registerNUmberCtrl.text.isEmpty || registerNUmberCtrl.text.isEmpty) {
        Get.snackbar('error', 'please fill the fields', colorText: Colors.red);
        return;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);

      if (otp != null) {
        otpFieldShown = true;
        otpSend = otp;
        Get.snackbar('Success', 'otp send successfully',
            colorText: Colors.green);
      } else {
        Get.snackbar('error', 'otp not send !!', colorText: Colors.red);
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      update();
    }
  }
}
