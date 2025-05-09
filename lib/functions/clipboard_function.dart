import "package:flutter/material.dart";
import "package:flutter/services.dart";

class ClipboardFunction {
  static void Function() copy(
    BuildContext context,
    TextEditingController controller,
  ) {
    return () {
      Clipboard.setData(ClipboardData(text: controller.text));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Durations.long4,
          backgroundColor: Theme.of(context).canvasColor,
          content: Text(
            "Copied to clipboard",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    };
  }

  static void Function() paste(
    BuildContext context,
    TextEditingController controller,
  ) {
    return () async {
      var data = await Clipboard.getData(Clipboard.kTextPlain);
      controller.text = data!.text ?? "";
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Durations.long4,
          backgroundColor: Theme.of(context).canvasColor,
          content: Text(
            "Pasted from clipboard",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    };
  }
}
