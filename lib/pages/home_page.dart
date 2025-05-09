import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/pages/encryption_page.dart";
import "package:cyber_sec/pages/message_authentication_page.dart";
import "package:cyber_sec/pages/miller_rabbin_page.dart";
import "package:cyber_sec/pages/password_generator_page.dart";
import "package:cyber_sec/pages/password_strength_tester_page.dart";
import "package:cyber_sec/pages/prime_generator_page.dart";
import "package:cyber_sec/pages/pseudo_random_generator_page.dart";
//import "package:cyber_sec/pages/video_test_page.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void Function() onPress(BuildContext context, Widget page) {
    return () {
      Navigator.of(
        context,
      ).push(CupertinoPageRoute(builder: (context) => page));
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "Miller Rabbin Test",
                onPress: onPress(context, MillerRabbinPage()),
              ),
              CustomButton(
                label: "Generate Prime Number",
                onPress: onPress(context, PrimeGeneratorPage()),
              ),
              CustomButton(
                label: "Text Encryption/Decryption",
                onPress: onPress(context, EncryptionPage()),
              ),
              CustomButton(
                label: "PseudoRandom Number",
                onPress: onPress(context, PseudoRandomGeneratorPage()),
              ),
              CustomButton(
                label: "Message Authentication",
                onPress: onPress(context, MessageAuthenticationPage()),
              ),
              CustomButton(
                label: "Password Generator",
                onPress: onPress(context, PasswordGeneratorPage()),
              ),
              CustomButton(
                label: "Password Strength Tester",
                onPress: onPress(context, PasswordStrengthTesterPage()),
              ),
              /* CustomButton(
                label: "Video Test",
                onPress: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => VideoTestPage()),
                  );
                },
              ), */
            ],
          ),
        ),
      ),
    );
  }
}
