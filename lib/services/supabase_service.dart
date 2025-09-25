import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/invoice.dart';
import '../models/invoice_item.dart';

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> saveInvoice({
    required String userId,
    required String clientId,
    required String invoiceNumber,
    required DateTime dueDate,
    required String currency,
    required List<InvoiceItem> items,
    required String notes,
  }) async {
    final invoiceResp = await _supabase.from('invoices').insert({
      'user_id': userId,
      'client_id': clientId,
      'invoice_number': invoiceNumber,
      'due_date': dueDate.toIso8601String(),
      'currency': currency,
      'notes': notes,
      'total_amount': items.fold(0.0, (sum, item) => sum + item.amount),
    }).select('id').single();
    final invoiceId = invoiceResp['id'];
    for (var item in items) {
      await _supabase.from('invoice_items').insert({
        'invoice_id': invoiceId,
        'description': item.description,
        'quantity': item.quantity,
        'unit_price': item.unitPrice,
        'amount': item.amount,
      });
    }
  }

  Future<List<Invoice>> getInvoices(String userId) async {
    final response = await _supabase.from('invoices').select('*, invoice_items(*)').eq('user_id', userId);
    return (response as List).map((json) => Invoice.fromJson(json)).toList();
  }
}