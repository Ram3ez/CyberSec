import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:cyber_sec/functions/clipboard_function.dart';
import 'package:cyber_sec/functions/message_authentication.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HmacGenerationPage extends StatelessWidget {
  HmacGenerationPage({super.key});

  final TextEditingController messageController = TextEditingController();

  final TextEditingController keyController = TextEditingController();

  final TextEditingController hmacController = TextEditingController();

  String mac = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          CustomTextField(
            label: "Message",
            controller: messageController,
            isNum: false,
          ),
          CustomTextField(
            label: "Key",
            controller: keyController,
            isNum: false,
          ),
          SizedBox(height: 40),
          CustomButton(
            label: "Generate HMAC",
            onPress: () {
              if (messageController.text != "" && keyController.text != "") {
                mac = MessageAuthentication.genMAC(
                  messageController.text,
                  keyController.text,
                );
              } else {
                mac = "";
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Durations.long4,
                    backgroundColor: Theme.of(context).canvasColor,
                    content: Text(
                      "Please Enter Both message and key",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
              hmacController.text = mac;
            },
          ),
          Spacer(),
          CustomTextField(
            label: "HMAC",
            controller: hmacController,
            readOnly: true,
            isNum: false,
            iconFunction: ClipboardFunction.copy(context, hmacController),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
