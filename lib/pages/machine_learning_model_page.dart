import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MachineLearningModelPage extends StatefulWidget {
  const MachineLearningModelPage({super.key});

  @override
  State<MachineLearningModelPage> createState() =>
      _MachineLearningModelPageState();
}

class _MachineLearningModelPageState extends State<MachineLearningModelPage> {
  final TextEditingController urlController = TextEditingController();
  String? _result;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _isLoading = true;
      _result = null;
    });

    final dio = Dio();
    try {
      final response = await dio.post(
        'https://r1shab-final.hf.space/gradio_api/call/predict',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "data": [urlController.text],
        },
      );

      final result = response.data["event_id"].toString();

      final response2 = await dio.get(
        'https://r1shab-final.hf.space/gradio_api/call/predict/$result',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      //_result = response2.data.toString().split("\n")[1].toLowerCase();
      final RegExp regex = RegExp(r'(Legitimate|Phishing) \(([^)]+)\)');

      final Match? match = regex.firstMatch(response2.data.toString());
      if (match != null) {
        switch (match.group(1)) {
          case 'Legitimate':
            _result = '✅ Result: This is a safe and legitimate source.';
          case 'Phishing':
            _result = '🚨 DANGER: This is a malicious phishing Link.';
          default:
            _result =
                '⚠️ ERROR: Could not determine the classification. Please be cautious.';
        }
      }
    } catch (e) {
      _result = "Error: $e";
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Machine Learning Model",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Enter URL",
              isNum: false,
              controller: urlController,
            ),
            SizedBox(height: 20),
            CustomButton(label: "Submit", onPress: _submit),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator(color: Theme.of(context).primaryColor)
            else if (_result != null) ...[
              Text(
                _result ?? "error",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color:
                      _result!.contains("phishing") ? Colors.red : Colors.green,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
