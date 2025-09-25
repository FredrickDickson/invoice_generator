class User {
  final String id;
  final String fullName;
  final String email;
  final String businessName;
  final String businessAddress;
  final String? logoUrl;
  final DateTime createdAt;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.businessName,
    required this.businessAddress,
    this.logoUrl,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    fullName: json['full_name'],
    email: json['email'],
    businessName: json['business_name'] ?? '',
    businessAddress: json['business_address'] ?? '',
    logoUrl: json['logo_url'],
    createdAt: DateTime.parse(json['created_at']),
  );
}