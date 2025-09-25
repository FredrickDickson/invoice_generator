class Client {
  final String id;
  final String userId;
  final String name;
  final String email;
  final String address;
  final DateTime createdAt;

  Client({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.address,
    required this.createdAt,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json['id'],
    userId: json['user_id'],
    name: json['name'],
    email: json['email'],
    address: json['address'] ?? '',
    createdAt: DateTime.parse(json['created_at']),
  );
}