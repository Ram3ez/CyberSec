import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/functions/switch_page.dart";
import "package:cyber_sec/pages/encryption_page.dart";
import "package:cyber_sec/pages/message_authentication_page.dart";
import "package:flutter/material.dart";

class InteractiveCryptoPage extends StatelessWidget {
  const InteractiveCryptoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Interactive Cryptography",
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "Text Encryption/Decryption",
                onPress: SwitchPage.switchPage(context, EncryptionPage()),
              ),
              CustomButton(
                label: "Message Authentication",
                onPress: SwitchPage.switchPage(
                  context,
                  MessageAuthenticationPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
