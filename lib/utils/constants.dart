import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String get paystackPublicKey => dotenv.env['PAYSTACK_PUBLIC_KEY']!;
  static String get paystackSecretKey => dotenv.env['PAYSTACK_SECRET_KEY']!;
  static String get supabaseUrl => dotenv.env['SUPABASE_URL']!;
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY']!;
  static const List<String> currencies = ['USD', 'EUR', 'GBP'];
}