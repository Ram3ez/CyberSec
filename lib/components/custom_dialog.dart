import "package:flutter/material.dart";

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor.withAlpha(255),
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        body,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
