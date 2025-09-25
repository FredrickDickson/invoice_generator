import 'dart:math';

String generateInvoiceNumber() {
  final random = Random();
  return 'INV-${DateTime.now().millisecondsSinceEpoch}-${random.nextInt(1000)}';
}

String formatCurrency(double amount, String currency) {
  return '$currency${amount.toStringAsFixed(2)}';
}