class InvoiceItem {
  final String id;
  final String invoiceId;
  final String description;
  final int quantity;
  final double unitPrice;
  final double amount;

  InvoiceItem({
    required this.id,
    required this.invoiceId,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.amount,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
    id: json['id'],
    invoiceId: json['invoice_id'],
    description: json['description'],
    quantity: json['quantity'],
    unitPrice: json['unit_price'].toDouble(),
    amount: json['amount'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'invoice_id': invoiceId,
    'description': description,
    'quantity': quantity,
    'unit_price': unitPrice,
    'amount': amount,
  };
}