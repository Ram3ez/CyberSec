import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_dialog.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:cyber_sec/functions/miller_rabbin_test.dart';
import 'package:flutter/material.dart';

class MillerRabbinPage extends StatefulWidget {
  const MillerRabbinPage({super.key});

  @override
  State<MillerRabbinPage> createState() => _MillerRabbinPageState();
}

class _MillerRabbinPageState extends State<MillerRabbinPage> {
  final TextEditingController controller = TextEditingController();
  bool isError = false;
  bool submitted = false;
  bool isPrime = false;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Miller-Rabin Primality Test Steps:",
        body: '''
  Step 1: Choose an odd integer n to test
  - The number n should be greater than 2.
  - If n is even, it is NOT prime (except for 2).
  
  Step 2: Write (n - 1) as (2^s * d)
  - Find the largest power of 2 that divides (n - 1).
  - Express (n - 1) as (2^s * d), where d is odd.
  
  Step 3: Choose a random integer a
  - Select a such that 2 ≤ a ≤ n - 2.
  
  Step 4: Compute x = a^d mod n
  - If x = 1 or x = n - 1, the test is inconclusive, and n may be prime.
  
  Step 5: Perform repeated squaring
  - Compute x = x^2 mod n up to (s - 1) times.
  - If x = n - 1 at any step, the test is inconclusive, and n may be prime.
  - If x never becomes n - 1, n is definitely composite.
  
  Step 6: Repeat the test for multiple values of a
  - Run the test with different values of a to increase accuracy.
  - If the test never fails for multiple values of a, n is probably prime.
  - If the test fails for any a, n is definitely composite.
                                  ''',
      ),
      title: "Miller Rabbin Test",
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(label: "Number:", controller: controller),
            isError
                ? Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please Enter a valid number",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.red),
                    ),
                  ),
                )
                : SizedBox.shrink(),
            SizedBox(height: 40),
            CustomButton(
              label: "Submit",
              onPress: () {
                if (controller.text == "") {
                  setState(() {
                    isError = true;
                    submitted = false;
                  });
                } else {
                  setState(() {
                    isError = false;
                  });
                  try {
                    isPrime = MillerRabbinTest.test(
                      BigInt.parse(controller.text),
                    );
                    setState(() {
                      submitted = true;
                    });
                  } catch (_) {
                    setState(() {
                      isError = true;
                      submitted = false;
                    });
                  }
                }
              },
            ),
            submitted
                ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "${controller.text} is ${isPrime ? "a" : "not a"} prime number",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: isPrime ? Colors.green : Colors.red,
                    ),
                  ),
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
