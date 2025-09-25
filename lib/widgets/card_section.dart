import 'package:flutter/material.dart';

class CardSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CardSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ...children,
          ],
        ),
      ),
    );
  }
}