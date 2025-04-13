import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/components/custom_text_field.dart";
import "package:cyber_sec/functions/message_authentication.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class VerifyHmacPage extends StatefulWidget {
  VerifyHmacPage({super.key});

  @override
  State<VerifyHmacPage> createState() => _VerifyHmacPageState();
}

class _VerifyHmacPageState extends State<VerifyHmacPage> {
  final TextEditingController messageController = TextEditingController();

  final TextEditingController keyController = TextEditingController();

  final TextEditingController hmacController = TextEditingController();

  bool? isValid;

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
          CustomTextField(
            label: "HMAC",
            controller: hmacController,
            isNum: false,
            iconFunction: () async {
              var data = await Clipboard.getData(Clipboard.kTextPlain);
              hmacController.text = data!.text ?? "";
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Durations.long4,
                  backgroundColor: Theme.of(context).canvasColor,
                  content: Text(
                    "Pasted from clipboard",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
          SizedBox(height: 40),
          CustomButton(
            label: "Verify HMAC",
            onPress: () {
              if (messageController.text != "" &&
                  keyController.text != "" &&
                  hmacController.text != "") {
                isValid = MessageAuthentication.checkMAC(
                  messageController.text,
                  keyController.text,
                  hmacController.text,
                );
                setState(() {});
              } else {
                isValid = null;
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Durations.long4,
                    backgroundColor: Theme.of(context).canvasColor,
                    content: Text(
                      "Please Enter message, key and hmac",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
          ),
          SizedBox(height: 40),
          isValid != null
              ? Text(
                "The Message is ${isValid! ? "valid" : "Invalid"}",
                style:
                    isValid!
                        ? Theme.of(
                          context,
                        ).textTheme.titleSmall?.copyWith(color: Colors.green)
                        : Theme.of(
                          context,
                        ).textTheme.titleSmall?.copyWith(color: Colors.red),
              )
              : SizedBox.shrink(),
          Spacer(),
        ],
      ),
    );
  }
}
