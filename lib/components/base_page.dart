import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.dialog,
    required this.title,
    required this.child,
  });
  final Widget dialog;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => dialog);
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: false,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: child,
      ),
    );
  }
}
