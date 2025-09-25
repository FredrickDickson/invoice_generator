import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';

class PdfService {
  static Future<Uint8List> generateInvoicePdf({
    required String businessName,
    required String businessAddress,
    required File? logo,
    required String clientName,
    required String clientEmail,
    required String clientAddress,
    required String invoiceNumber,
    required List<Map<String, dynamic>> items,
    required double totalAmount,
    required String currency,
    required String notes,
  }) async {
    final pdf = pw.Document();
    final logoBytes = logo?.readAsBytesSync() ?? Uint8List(0);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Row(children: [
              if (logoBytes.isNotEmpty) pw.Image(pw.MemoryImage(logoBytes), width: 100),
              pw.SizedBox(width: 10),
              pw.Text(businessName, style: pw.TextStyle(fontSize: 20)),
            ]),
            pw.Text('Invoice #$invoiceNumber | Date: ${DateTime.now().toIso8601String().split('T')[0]}'),
            pw.Text('Client: $clientName\nEmail: $clientEmail\nAddress: $clientAddress'),
            pw.Table.fromTextArray(
              headers: ['Description', 'Qty', 'Rate', 'Amount'],
              data: items.map((item) => [
                item['desc'],
                item['qty'].toString(),
                '$currency${item['price']}',
                '$currency${item['qty'] * item['price']}',
              ]).toList(),
            ),
            pw.Text('Total: $currency${totalAmount.toStringAsFixed(2)}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.Text('Notes: $notes'),
          ],
        ),
      ),
    );
    return pdf.save();
  }
}