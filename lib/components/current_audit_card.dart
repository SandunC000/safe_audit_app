import 'package:flutter/material.dart';

class AuditCard extends StatefulWidget {
  final String title;
  final String location;
  final String depositDate;
  final String depositor;
  final String date;

  const AuditCard(
      {super.key,
      required this.title,
      required this.location,
      required this.depositDate,
      required this.depositor,
      required this.date});

  @override
  State<AuditCard> createState() => _AuditCardState();
}

class _AuditCardState extends State<AuditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Adjust the height as needed
      margin: const EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Color(0xFF26467F), fontWeight: FontWeight.w600),
                  ),
                  Text(widget.location),
                  Text(
                      "Deposited on ${widget.depositDate} by ${widget.depositor}"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.date,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const Text(
                    "1 day delay",
                    style: TextStyle(
                        color: Colors.red,
                        backgroundColor: Color(0xFFFFF0EB),
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Divider(
                      thickness: 10,
                      color: Colors.red,
                    ),
                    Image.asset(
                      'lib/images/start.png',
                      width: 26,
                      height: 22,
                    ),
                    const Text("Start Audit"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
