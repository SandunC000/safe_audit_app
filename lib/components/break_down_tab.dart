import 'package:flutter/material.dart';

class BreakDownTab extends StatefulWidget {
  final Function(double) onTotalChanged;
  const BreakDownTab({Key? key, required this.onTotalChanged}) : super(key: key);

  @override
  State<BreakDownTab> createState() => _BreakDownTabState();
}

class _BreakDownTabState extends State<BreakDownTab> {
  final List<Map<String, dynamic>> notesCoinsData = [
    {'value': 100, 'quantity': 0},
    {'value': 50, 'quantity': 0},
    {'value': 20, 'quantity': 0},
    {'value': 10, 'quantity': 0},
    {'value': 5, 'quantity': 0},
    {'value': 2, 'quantity': 0},
    {'value': 1, 'quantity': 0},
    {'value': 0.50, 'quantity': 0},
    {'value': 0.25, 'quantity': 0},
    {'value': 0.10, 'quantity': 0},
    {'value': 0.05, 'quantity': 0},
  ];

  double calculateTotal() {
    double total = 0.0;
    for (var item in notesCoinsData) {
      total += item['value'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Notes/Coins')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Value')),
      ],
      rows: notesCoinsData.map<DataRow>((noteCoin) {
        return DataRow(
          cells: [
            DataCell(Text('\$${noteCoin['value']}')),
            DataCell(
              Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (noteCoin['quantity'] > 0) {
                          noteCoin['quantity']--;
                          widget.onTotalChanged(calculateTotal());
                        }
                      });
                    },
                  ),
                  Text('${noteCoin['quantity']}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        noteCoin['quantity']++;
                        widget.onTotalChanged(calculateTotal());
                      });
                    },
                  ),
                ],
              ),
            ),
            DataCell(Text('\$${(noteCoin['value'] * noteCoin['quantity']).toStringAsFixed(2)}')),
          ],
        );
      }).toList(),
    );
  }
}
