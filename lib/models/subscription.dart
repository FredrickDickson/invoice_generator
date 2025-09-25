class Subscription {
  final String id;
  final String userId;
  final String paystackSubscriptionId;
  final String plan;
  final String status;
  final DateTime currentPeriodEnd;
  final DateTime createdAt;

  Subscription({
    required this.id,
    required this.userId,
    required this.paystackSubscriptionId,
    required this.plan,
    required this.status,
    required this.currentPeriodEnd,
    required this.createdAt,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
        userId: json['user_id'],
        paystackSubscriptionId: json['paystack_subscription_id'],
        plan: json['plan'],
        status: json['status'],
        currentPeriodEnd: DateTime.parse(json['current_period_end']),
        createdAt: DateTime.parse(json['created_at']),
      );
}
