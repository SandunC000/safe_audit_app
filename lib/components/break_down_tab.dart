import 'package:flutter/material.dart';

class BreakDownTab extends StatefulWidget {
  final Function(double) onTotalChanged;
  const BreakDownTab({Key? key, required this.onTotalChanged})
      : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: DataTable(
          decoration: const BoxDecoration(
              border: Border(
            left: BorderSide(width: 1.0),
            right: BorderSide(width: 1.0),
            top: BorderSide(width: 1.0),
            bottom: BorderSide(width: 1.0),
          )),
          columnSpacing: 10,
          columns: const [
            DataColumn(label: Text('Notes /\nCoins')),
            DataColumn(label: Text('Quantity')),
            DataColumn(label: Text('Value')),
          ],
          rows: notesCoinsData.map<DataRow>((noteCoin) {
            TextEditingController quantityController =
                TextEditingController(text: noteCoin['quantity'].toString());
            return DataRow(
              cells: [
                DataCell(Text(
                  '\$${noteCoin['value']}',
                  style: TextStyle(color: Color(0xFF5A5A5A)),
                )),
                DataCell(
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (noteCoin['quantity'] > 0) {
                                noteCoin['quantity']--;
                                widget.onTotalChanged(calculateTotal());
                                quantityController.text =
                                    noteCoin['quantity'].toString();
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 10, // Adjust the width as needed
                          child: TextField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            decoration: null,
                            onChanged: (value) {
                              setState(() {
                                noteCoin['quantity'] = int.parse(value);
                                widget.onTotalChanged(calculateTotal());
                              });
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              noteCoin['quantity']++;
                              widget.onTotalChanged(calculateTotal());
                              quantityController.text =
                                  noteCoin['quantity'].toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                DataCell(Text(
                  '\$${(noteCoin['value'] * noteCoin['quantity']).toStringAsFixed(2)}',
                  style: const TextStyle(color: Color(0xFF1A1A1A)),
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
