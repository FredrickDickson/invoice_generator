import 'package:flutter/material.dart';
import 'package:flutter_paystack_plus/flutter_paystack_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';

class PaystackService {
  final PaystackPlus _paystack = PaystackPlus();
  final String _publicKey = 'pk_test_your_key'; // Replace with your Paystack public key
  final String _secretKey = 'sk_test_your_key'; // Replace with your Paystack secret key

  Future<void> subscribeToPro(BuildContext context, String email, String planCode) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.paystack.co/transaction/initialize'),
        headers: {'Authorization': 'Bearer $_secretKey', 'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'amount': 90000, // ₦9,000 * 100 (kobo)
          'plan': planCode, // e.g., 'pro_monthly' from Paystack dashboard
          'channels': ['card', 'bank_transfer'],
        }),
      );
      final data = jsonDecode(response.body);
      if (data['status']) {
        final accessCode = data['data']['access_code'];
        final charge = Charge()
          ..accessCode = accessCode
          ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}'
          ..amount = 90000
          ..email = email
          ..currency = 'NGN';
        final payResponse = await _paystack.checkout(
          context,
          charge: charge,
          method: CheckoutMethod.selectable,
          onClosed: (status) => print('Checkout closed: $status'),
        );
        if (payResponse?.status == true) {
          await _verifyAndSaveSubscription(payResponse!.reference, email);
        }
      }
    } catch (e) {
      print('Paystack error: $e');
    }
  }

  Future<void> _verifyAndSaveSubscription(String reference, String email) async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;
    final verifyResponse = await http.get(
      Uri.parse('https://api.paystack.co/transaction/verify/$reference'),
      headers: {'Authorization': 'Bearer $_secretKey'},
    );
    final verifyData = jsonDecode(verifyResponse.body);
    if (verifyData['status'] && verifyData['data']['status'] == 'success') {
      await supabase.from('subscriptions').insert({
        'user_id': user?.id,
        'paystack_subscription_id': verifyData['data']['subscription_id'],
        'plan': 'pro_monthly',
        'status': 'active',
        'current_period_end': DateTime.now().add(Duration(days: 30)),
      });
    }
  }
}