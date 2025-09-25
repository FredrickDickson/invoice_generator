import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final VoidCallback onDownload;
  final VoidCallback onSend;
  final VoidCallback onBack;

  const ButtonRow({required this.onDownload, required this.onSend, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: onDownload, child: Text('Download')),
        SizedBox(width: 10),
        ElevatedButton(onPressed: onSend, child: Text('Send')),
        SizedBox(width: 10),
        TextButton(onPressed: onBack, child: Text('Back to Edit')),
      ],
    );
  }
}