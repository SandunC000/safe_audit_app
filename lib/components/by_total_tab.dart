import 'package:flutter/material.dart';

class ByTotalTab extends StatefulWidget {
  final Function(double) onTotalChanged;
  const ByTotalTab({super.key, required this.onTotalChanged});

  @override
  State<ByTotalTab> createState() => _ByTotalTabState();
}

class _ByTotalTabState extends State<ByTotalTab> {
  final TextEditingController _controller = TextEditingController();

  String get enteredTotal => _controller.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Enter the total amount inside the safe (\$)"),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 40, color: Color(0xFF8D8D8D)),
              onChanged: (value) {
                try {
                  widget.onTotalChanged(double.parse(value));
                } catch (e) {
                  widget.onTotalChanged(0.0);
                }
              },
              decoration: const InputDecoration(
                  hintText: '00.00',
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFD9D9D5), width: 1)),
                  contentPadding: EdgeInsets.all(15)),
            )
          ],
        ),
      ),
    );
  }
}
