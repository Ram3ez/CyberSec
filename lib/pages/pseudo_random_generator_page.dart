import "package:cyber_sec/components/base_page.dart";
import "package:cyber_sec/components/custom_button.dart";
import "package:cyber_sec/components/custom_dialog.dart";
import "package:cyber_sec/components/custom_slider.dart";
import "package:cyber_sec/components/custom_switch.dart";
import "package:cyber_sec/functions/pseudo_random_generator.dart";
import "package:flutter/material.dart";

// ignore: must_be_immutable
class PseudoRandomGeneratorPage extends StatefulWidget {
  PseudoRandomGeneratorPage({super.key});
  double minValue = 0.0;
  double maxValue = 100;
  int? randomNum;
  String result = "";
  bool submitted = false;
  bool isError = false;
  bool isAscii = false;

  @override
  State<PseudoRandomGeneratorPage> createState() =>
      _PseudoRandomGeneratorPageState();
}

class _PseudoRandomGeneratorPageState extends State<PseudoRandomGeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      dialog: CustomDialog(
        title: "Pseudo-Random Number Generator (PRNG)",
        body: ''' 
 What is a PRNG?
A Pseudo-Random Number Generator (PRNG) is an algorithm that generates a sequence of numbers that look random, but are actually deterministic. This means if you start with the same seed value, the generator will always produce the same sequence of numbers.

 Why "Pseudo"?
Unlike true randomness (like flipping a coin), PRNGs are based on formulas. Their results are repeatable and predictable if you know the initial input (seed), so they are not suitable for secure encryption.

 Common Formula Used — Linear Congruential Generator (LCG)
A popular and simple PRNG formula is the Linear Congruential Generator (LCG):
Next = (a × Current + c) mod m

Where:

Current is the current number (starting with the seed)

a is a multiplier

c is an increment

m is the modulus

Next is the next random-looking number in the sequence

By repeating this formula, we generate a sequence of pseudo-random numbers.

PRNGs are fast and useful for simulations, games, or simple apps, but they are not secure. For cryptographic applications, you must use Cryptographically Secure PRNGs (CSPRNG), which are designed to be unpredictable and resistant to reverse-engineering.
''',
      ),
      title: "Random Number Generator",
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              CustomSlider(
                sliderValue: widget.minValue,
                minVal: 0,
                maxVal: 1000,
                label: "Minimum Value",
                onChanged: (double val) {
                  setState(() {
                    widget.minValue = val;
                  });
                },
              ),
              CustomSlider(
                sliderValue: widget.maxValue,
                minVal: 0,
                maxVal: 1000,
                label: "Maximum Value",
                onChanged: (double val) {
                  setState(() {
                    widget.maxValue = val;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomSwitch(
                curVal: widget.isAscii,
                centered: true,
                onChange: (val) {
                  widget.isAscii = val;
                  setState(() {});
                },
                label: "Use ASCII Generator",
              ),
              Spacer(),
              CustomButton(
                label: "Generate Random Number",
                onPress: () {
                  try {
                    widget.isError = false;
                    if (widget.maxValue < widget.minValue ||
                        widget.maxValue == widget.minValue) {
                      widget.isError = true;
                    }
                    setState(() {
                      widget.submitted = true;
                      widget.randomNum =
                          widget.isAscii
                              ? PseudoRandomGenerator.generateAscii(
                                widget.minValue.toInt(),
                                widget.maxValue.toInt(),
                              )
                              : PseudoRandomGenerator.generate(
                                widget.minValue.toInt(),
                                widget.maxValue.toInt(),
                              );
                    });
                  } on RangeError catch (_) {
                    widget.submitted = true;
                    widget.isError = true;
                    setState(() {});
                  } catch (_) {}
                },
              ),
              widget.submitted && !widget.isError
                  ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Generated Random Number: ${widget.randomNum}",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.green),
                    ),
                  )
                  : widget.isError
                  ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Invalid Range",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: Colors.red),
                    ),
                  )
                  : SizedBox.shrink(),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
