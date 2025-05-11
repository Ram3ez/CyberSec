import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/functions/switch_page.dart";
import "package:cyber_sec/pages/password_generator_page.dart";
import "package:cyber_sec/pages/password_strength_tester_page.dart";
import "package:flutter/material.dart";

class PasswordSecurityPage extends StatelessWidget {
  const PasswordSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Password Security Toolkit",
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "Password Generator",
                onPress: SwitchPage.switchPage(
                  context,
                  PasswordGeneratorPage(),
                ),
              ),
              CustomButton(
                label: "Password Strength Tester",
                onPress: SwitchPage.switchPage(
                  context,
                  PasswordStrengthTesterPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
