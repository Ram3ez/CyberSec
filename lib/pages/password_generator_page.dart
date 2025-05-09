import "dart:math";

import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/components/custom_dialog.dart";
import "package:cyber_sec/components/custom_slider.dart";
import "package:cyber_sec/components/custom_switch.dart";
import "package:cyber_sec/components/custom_text_field.dart";
import "package:cyber_sec/functions/clipboard_function.dart";
import "package:flutter/material.dart";

class PasswordGeneratorPage extends StatefulWidget {
  const PasswordGeneratorPage({super.key});

  @override
  State<PasswordGeneratorPage> createState() => _PasswordGeneratorPageState();
}

class _PasswordGeneratorPageState extends State<PasswordGeneratorPage> {
  bool includeUpper = false;
  bool includeLower = false;
  bool includeNumber = false;
  bool includeSpecial = false;
  double length = 10;

  final TextEditingController passwordController = TextEditingController();

  final String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final String lower = 'abcdefghijklmnopqrstuvwxyz';
  final String nums = '0123456789';
  final String special = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

  String chars = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(title: "Password Generator", body: "NONE"),
      title: "Password Generator",
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          spacing: 10,
          children: [
            CustomSwitch(
              curVal: includeUpper,
              label: "Include Upper Case",
              onChange: (val) {
                setState(() {
                  includeUpper = val;
                });
              },
            ),
            CustomSwitch(
              curVal: includeLower,
              label: "Include Lower Case",
              onChange: (val) {
                setState(() {
                  includeLower = val;
                });
              },
            ),
            CustomSwitch(
              curVal: includeNumber,
              label: "Include Numbers",
              onChange: (val) {
                setState(() {
                  includeNumber = val;
                });
              },
            ),
            CustomSwitch(
              curVal: includeSpecial,
              label: "Include Special Characters",
              onChange: (val) {
                includeSpecial = val;
                setState(() {});
              },
            ),
            CustomSlider(
              sliderValue: length,
              minVal: 6,
              maxVal: 30,
              label: "length",
              onChanged: (val) {
                length = val;
                setState(() {});
              },
            ),
            CustomButton(
              label: "Generate Password",
              onPress: () {
                chars = "";
                if (includeLower) chars += lower;
                if (includeUpper) chars += upper;
                if (includeNumber) chars += nums;
                if (includeSpecial) chars += special;

                if (chars.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      backgroundColor: Theme.of(context).canvasColor,
                      content: Text(
                        "Please Include Any Character Set",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  passwordController.text = "";
                } else {
                  password =
                      List.generate(
                        length.toInt(),
                        (index) => chars[Random.secure().nextInt(chars.length)],
                      ).join();
                  passwordController.text = password;
                }
              },
            ),
            Spacer(),
            CustomTextField(
              label: "Password",
              controller: passwordController,
              isNum: false,
              readOnly: true,
              iconFunction: ClipboardFunction.copy(context, passwordController),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
