import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moobile_vault_user/controller/login_controller.dart';
import 'package:moobile_vault_user/widgets/otp_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (ctrl) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.registerNameCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(Icons.phone_android),
                      label: Text('Your Name'),
                      hintText: 'Enter your name'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.registerNUmberCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(Icons.phone_android),
                      label: Text('Mobile Number'),
                      hintText: 'Mobile Number'),
                ),
                SizedBox(
                  height: 20,
                ),
                OtpTextField(
                  otpController: ctrl.otpController,
                  visible: ctrl.otpFieldShown,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (ctrl.otpFieldShown) {
                        ctrl.addUser();
                      } else {
                        ctrl.sendOtp();
                      }
                      ctrl.sendOtp();
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue),
                    child: Text(ctrl.otpFieldShown ? 'register' : 'Send Otp')),
                TextButton(
                    onPressed: () {
                      // Add your navigation to login here
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        );
      },
    );
  }
}
