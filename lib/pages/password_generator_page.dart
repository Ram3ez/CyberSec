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
  List<String> required = [];
  String password = "";
  int remaining = 0;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Password Generator",
        body: """
What Does It Do?
This feature helps you create strong and random passwords to keep your online accounts secure. You get full control over how your password looks—choose the length and what types of characters you want to include!

 How It Works
A password is created by randomly selecting characters from a set of options that you choose:

✅ Uppercase letters (A–Z)

✅ Lowercase letters (a–z)

✅ Numbers (0–9)

✅ Special characters (!, @, #, etc.)

Once you select your preferences and length (from 6 to 30 characters), the app generates a password by randomly picking characters from the combined set using a secure random function.

This module uses Random.secure() from Dart’s dart:math library, which interfaces with a cryptographically secure random number generator (CSPRNG) provided by the underlying OS (such as /dev/urandom on Unix or CryptGenRandom on Windows).

 How It Works:
Character Pool Construction:
Based on user choices (uppercase, lowercase, digits, symbols), a character set is built.

Secure Random Selection:
For each position in the password, Random.secure().nextInt(n) selects a random index securely from the character pool.

Password Formation:
The selected characters are concatenated into a final password string


 Why Use This?
Strong passwords are harder to guess or crack.

Using a secure random generator makes the password unpredictable.

Customization allows you to match the requirements of most websites and apps.""",
      ),
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
                required = [];
                if (includeLower) {
                  chars += lower;
                  required.add(lower[Random.secure().nextInt(lower.length)]);
                }
                if (includeUpper) {
                  chars += upper;
                  required.add(upper[Random.secure().nextInt(upper.length)]);
                }
                if (includeNumber) {
                  chars += nums;
                  required.add(nums[Random.secure().nextInt(nums.length)]);
                }
                if (includeSpecial) {
                  chars += special;
                  required.add(
                    special[Random.secure().nextInt(special.length)],
                  );
                }

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
                  remaining = length.toInt() - required.length;
                  password =
                      (List.generate(
                              remaining, //length.toInt(),
                              (index) =>
                                  chars[Random.secure().nextInt(chars.length)],
                            )
                            ..addAll(required)
                            ..shuffle(Random.secure()))
                          .join(); //.join();
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
