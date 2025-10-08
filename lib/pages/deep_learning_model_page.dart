import 'package:cyber_sec/components/base_page.dart';
import 'package:cyber_sec/components/custom_button.dart';
import 'package:cyber_sec/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DeepLearningModelPage extends StatefulWidget {
  const DeepLearningModelPage({super.key});

  @override
  State<DeepLearningModelPage> createState() => _DeepLearningModelPageState();
}

class _DeepLearningModelPageState extends State<DeepLearningModelPage> {
  final TextEditingController urlController = TextEditingController();
  String? _result;
  String? _confidence;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _isLoading = true;
      _result = null;
    });

    final dio = Dio();
    try {
      final response = await dio.post(
        'https://r1shab-second-review.hf.space/gradio_api/call/predict',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: {
          "data": [urlController.text],
        },
      );

      final result = response.data["event_id"].toString();

      final response2 = await dio.get(
        'https://r1shab-second-review.hf.space/gradio_api/call/predict/$result',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      //_result = response2.data.toString().split("\n")[1].toLowerCase();
      final RegExp regex = RegExp(
        r'(Legitimate \(Safe\)|PHISHING \(Malicious\))", "(\d+\.\d+%)',
      );
      final Match? match = regex.firstMatch(response2.data.toString());
      if (match != null) {
        _confidence = match.group(2);
        switch (match.group(1)) {
          case 'Legitimate (Safe)':
            _result = '✅ Result: This is a safe and legitimate source.';
          case 'PHISHING (Malicious)':
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
      title: "Deep Learning Model",
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
              Text(
                "Confidence Level: ${_confidence ?? "error"}",
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
