import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void showShowcaseDialog(BuildContext context) {
  showDialog(context: context, builder: (_) => const ShowcaseDialog());
}

class ShowcaseDialog extends StatelessWidget {
  const ShowcaseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Information'),
      content: const Text(
          'Feature not found, this is only health showcase UI, not fully functional application'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: const Text('Close'),
        )
      ],
    );
  }
}
