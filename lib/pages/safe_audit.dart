import 'package:flutter/material.dart';
import 'package:safe_audit_app/components/current_audit_card.dart';
import 'package:safe_audit_app/components/past_audit.dart';
import 'package:safe_audit_app/components/selective_button.dart';
import '../components/add_button.dart';
import '../components/main_app_bar.dart';

class SafeAudit extends StatefulWidget {
  const SafeAudit({super.key});

  @override
  State<SafeAudit> createState() => _SafeAuditState();
}

class _SafeAuditState extends State<SafeAudit> {
  String selectedOption = "Current Audit";

  List<Map<String, String>> auditData = [
    {
      'title': 'Title 1',
      'location': 'Location 1',
      'depositDate': 'Deposit Date 1',
      'depositor': 'Depositor 1',
      'date': 'Date 1',
    },
    {
      'title': 'Title 2',
      'location': 'Location 2',
      'depositDate': 'Deposit Date 2',
      'depositor': 'Depositor 2',
      'date': 'Date 2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Safe Audit',
      ),
      body: Container(
        color: Colors.grey[300],
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF26467F),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: buildTextButton("Current Audit",
                              selectedOption, handleButtonPress)),
                      Expanded(
                          child: buildTextButton(
                              "Past Audit", selectedOption, handleButtonPress)),
                    ],
                  ),
                ),
                selectedOption == "Current Audit"
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: auditData.length,
                          itemBuilder: (context, index) {
                            return AuditCard(
                              title: auditData[index]['title'] ?? '',
                              location: auditData[index]['location'] ?? '',
                              depositDate:
                                  auditData[index]['depositDate'] ?? '',
                              depositor: auditData[index]['depositor'] ?? '',
                              date: auditData[index]['date'] ?? '',
                            );
                          },
                        ),
                      )
                    : const PastAudit(),
              ],
            ),
            const Positioned(bottom: 50, right: 16, child: AddButton())
          ]),
        ),
      ),
    );
  }

  void handleButtonPress(String option) {
    setState(() {
      selectedOption = option;
    });
  }
}
