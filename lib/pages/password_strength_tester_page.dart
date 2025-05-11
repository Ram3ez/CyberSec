import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_dialog.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:cyber_sec/functions/clipboard_function.dart';
import 'package:flutter/material.dart';

class PasswordStrengthTesterPage extends StatefulWidget {
  const PasswordStrengthTesterPage({super.key});

  @override
  State<PasswordStrengthTesterPage> createState() =>
      _PasswordStrengthTesterPageState();
}

class _PasswordStrengthTesterPageState
    extends State<PasswordStrengthTesterPage> {
  final TextEditingController passwordController = TextEditingController();

  bool long = false;

  bool hasUpperCase = false;

  bool hasLowerCase = false;

  bool hasSpecial = false;

  bool hasNumber = false;

  bool isStrong = false;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Password Strength Tester",
        body: """
This module evaluates password strength using pattern-matching techniques to check for essential security characteristics. It uses regular expressions (regex) to validate the presence of key components commonly recommended in cybersecurity guidelines.

 What It Checks:
Length Requirement
Ensures the password is at least 8 characters long. Longer passwords are exponentially harder to brute-force.

Uppercase Letter Check
Uses regex to detect at least one capital letter (A–Z), improving entropy.

Lowercase Letter Check
Looks for at least one lowercase letter (a–z) to avoid uniform casing.

Numeric Character Check
Confirms the inclusion of digits (0–9) to increase variability.

Special Character Check
Detects characters like !@#\$%^&* which expand the character set and resist dictionary attacks.

Security Rationale:
A strong password includes a combination of character types and sufficient length to increase entropy (randomness). This reduces vulnerability to:

Brute-force attacks

Dictionary attacks

Pattern-based guessing

The app marks a password as strong only if all five conditions are met. The logic is deterministic and purely local (no data is sent), making it secure and privacy-friendly.""",
      ),
      title: "Password Strength",
      child: Container(
        margin: EdgeInsets.only(top: 150),
        child: Column(
          spacing: 20,
          children: [
            CustomTextField(
              label: "Password",
              controller: passwordController,
              isNum: false,
              iconFunction: ClipboardFunction.paste(
                context,
                passwordController,
              ),
            ),
            CustomButton(
              label: "Check Strength",
              onPress: () {
                if (passwordController.text.length >= 8) {
                  long = true;
                } else {
                  long = false;
                }
                if (RegExp(r'[A-Z]').hasMatch(passwordController.text)) {
                  hasUpperCase = true;
                } else {
                  hasUpperCase = false;
                }
                if (RegExp(r'[a-z]').hasMatch(passwordController.text)) {
                  hasLowerCase = true;
                } else {
                  hasLowerCase = false;
                }
                if (RegExp(r'[0-9]').hasMatch(passwordController.text)) {
                  hasNumber = true;
                } else {
                  hasNumber = false;
                }
                if (RegExp(
                  r'[!@#\$%^&*(),.?":{}|<>]',
                ).hasMatch(passwordController.text)) {
                  hasSpecial = true;
                } else {
                  hasSpecial = false;
                }

                if (long &&
                    hasLowerCase &&
                    hasUpperCase &&
                    hasNumber &&
                    hasUpperCase &&
                    hasSpecial) {
                  isStrong = true;
                } else {
                  isStrong = false;
                }
                setState(() {});
              },
            ),
            passwordController.text != ""
                ? Column(
                  children: [
                    isStrong
                        ? Text(
                          "Entered Password Is Strong",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Colors.green),
                        )
                        : SizedBox.shrink(),
                    !long
                        ? Text(
                          "Less than 8 Characters",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Colors.red),
                        )
                        : SizedBox.shrink(),
                    !hasLowerCase
                        ? Text(
                          "Does not contain Lower Case characters",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Colors.red),
                        )
                        : SizedBox.shrink(),
                    !hasUpperCase
                        ? Text(
                          "Does not contain Upper Case characters",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Colors.red),
                        )
                        : SizedBox.shrink(),
                    !hasNumber
                        ? Text(
                          "Does not contain Numbers",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Colors.red),
                        )
                        : SizedBox.shrink(),
                    !hasSpecial
                        ? Text(
                          "Does not contain Special Characters",
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(color: Colors.red),
                        )
                        : SizedBox.shrink(),
                  ],
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
