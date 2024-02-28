import 'package:flutter/material.dart';

class SaveAuditButton extends StatefulWidget {
  final double total;
  const SaveAuditButton({super.key, required this.total});

  @override
  State<SaveAuditButton> createState() => _SaveAuditButtonState();
}

class _SaveAuditButtonState extends State<SaveAuditButton> {
  double total = 0.0;

  @override
  void didUpdateWidget(covariant SaveAuditButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.total != total) {
      setState(() {
        total = widget.total;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: const Color(0xFF26467F),
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                    child: Text(
                  "Save Audit",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                )),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text('Expected :'),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Variance :',
                      style: TextStyle(color: Color(0xFFED3838)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Total :${widget.total.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFF004385)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
