import 'package:flutter/material.dart';

class InvoiceTable extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const InvoiceTable({required this.items});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Description')),
        DataColumn(label: Text('Qty')),
        DataColumn(label: Text('Rate')),
        DataColumn(label: Text('Amount')),
      ],
      rows: items.map((item) => DataRow(cells: [
        DataCell(Text(item['desc'])),
        DataCell(Text(item['qty'].toString())),
        DataCell(Text('\$${item['price']}')),
        DataCell(Text('\$${item['qty'] * item['price']}')),
      ])).toList(),
    );
  }
}