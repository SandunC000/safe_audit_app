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
    {'value': '100', 'quantity': 0},
    {'value': '50', 'quantity': 0},
    {'value': '20', 'quantity': 0},
    {'value': '10', 'quantity': 0},
    {'value': '5', 'quantity': 0},
    {'value': '2', 'quantity': 0},
    {'value': '1', 'quantity': 0},
    {'value': '0.50', 'quantity': 0},
    {'value': '0.25', 'quantity': 0},
    {'value': '0.10', 'quantity': 0},
    {'value': '0.05', 'quantity': 0},
  ];

  late List<TextEditingController> quantityControllers;

  @override
  void initState() {
    super.initState();
    quantityControllers = List.generate(
      notesCoinsData.length,
      (index) => TextEditingController(
          text: notesCoinsData[index]['quantity'].toString()),
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in notesCoinsData) {
      total += double.parse(item['value']) * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: DataTable(
          border: const TableBorder(
            left: BorderSide(width: 1.0, color: Color(0xFFE4E4E3)),
            right: BorderSide(width: 1.0, color: Color(0xFFE4E4E3)),
            top: BorderSide(width: 1.0, color: Color(0xFFE4E4E3)),
            bottom: BorderSide(width: 1.0, color: Color(0xFFE4E4E3)),
            horizontalInside: BorderSide(width: 1.0, color: Color(0xFFE4E4E3)),
          ),
          columnSpacing: 5,
          columns: const [
            DataColumn(label: Text('Notes /\nCoins')),
            DataColumn(label: Text('Quantity')),
            DataColumn(label: Text('Value')),
          ],
          rows: notesCoinsData.asMap().entries.map<DataRow>((entry) {
            int index = entry.key;
            Map<String, dynamic> noteCoin = entry.value;
            return DataRow(
              cells: [
                DataCell(Text(
                  '\$${noteCoin['value']}',
                  style: const TextStyle(color: Color(0xFF5A5A5A)),
                )),
                DataCell(
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFD9D9D5)),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (noteCoin['quantity'] > 0) {
                                noteCoin['quantity']--;
                                widget.onTotalChanged(calculateTotal());
                                quantityControllers[index].text =
                                    noteCoin['quantity'].toString();
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 30,
                          child: TextField(
                            controller: quantityControllers[index],
                            keyboardType: TextInputType.number,
                            decoration: null,
                            onChanged: (value) {
                              try {
                                if (value.isEmpty) {
                                  noteCoin['quantity'] = 0;
                                } else {
                                  noteCoin['quantity'] = int.parse(value);
                                }
                                widget.onTotalChanged(calculateTotal());
                              } catch (e) {
                                //
                              } finally {
                                final val = TextSelection.collapsed(
                                    offset:
                                        quantityControllers[index].text.length);
                                quantityControllers[index].selection = val;
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              noteCoin['quantity']++;
                              widget.onTotalChanged(calculateTotal());
                              quantityControllers[index].text =
                                  noteCoin['quantity'].toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: MediaQuery.of(context).size.width*0.2,
                    child: Text(
                      '\$${(double.parse(noteCoin['value']) * noteCoin['quantity']).toStringAsFixed(2)}',
                      style: const TextStyle(color: Color(0xFF1A1A1A)),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
