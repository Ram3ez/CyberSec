import "package:cyber_sec/components/custom_grid_button.dart";
import "package:cyber_sec/functions/switch_page.dart";
import "package:cyber_sec/pages/interactive_crypto_page.dart";
import "package:cyber_sec/pages/number_theory_page.dart";
import "package:cyber_sec/pages/password_security_page.dart";
import "package:cyber_sec/pages/phishing_prediction_page.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  CustomGridButton(
                    label: "Interactive Cryptography Tools",
                    onPress: SwitchPage.switchPage(
                      context,
                      InteractiveCryptoPage(),
                    ),
                  ),
                  CustomGridButton(
                    label: "Number Theory & Key Generation",
                    onPress: SwitchPage.switchPage(context, NumberTheoryPage()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  CustomGridButton(
                    label: "Password Security Toolkit",
                    onPress: SwitchPage.switchPage(
                      context,
                      PasswordSecurityPage(),
                    ),
                  ),
                  CustomGridButton(
                    label: "Phishing Link Detector",
                    onPress: SwitchPage.switchPage(
                      context,
                      PhishingPredictionPage(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
