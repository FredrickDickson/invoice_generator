class Invoice {
  final String id;
  final String userId;
  final String clientId;
  final String invoiceNumber;
  final DateTime issueDate;
  final DateTime dueDate;
  final String status;
  final double totalAmount;
  final String currency;
  final String notes;
  final DateTime createdAt;

  Invoice({
    required this.id,
    required this.userId,
    required this.clientId,
    required this.invoiceNumber,
    required this.issueDate,
    required this.dueDate,
    required this.status,
    required this.totalAmount,
    required this.currency,
    required this.notes,
    required this.createdAt,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    id: json['id'],
    userId: json['user_id'],
    clientId: json['client_id'],
    invoiceNumber: json['invoice_number'],
    issueDate: DateTime.parse(json['issue_date']),
    dueDate: DateTime.parse(json['due_date']),
    status: json['status'],
    totalAmount: json['total_amount'].toDouble(),
    currency: json['currency'],
    notes: json['notes'],
    createdAt: DateTime.parse(json['created_at']),
  );
}