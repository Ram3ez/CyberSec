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
      dialog: CustomDialog(title: "Password Strength Tester", body: "NONE"),
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
                    hasUpperCase) {
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
