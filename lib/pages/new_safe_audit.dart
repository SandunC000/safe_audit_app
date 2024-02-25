import 'package:flutter/material.dart';
import 'package:safe_audit_app/components/secondary_app_bar.dart';

class NewSafeAudit extends StatefulWidget {
  const NewSafeAudit({super.key});

  @override
  State<NewSafeAudit> createState() => _NewSafeAuditState();
}

class _NewSafeAuditState extends State<NewSafeAudit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SecondaryAppBar(title: "Start New Safe Audit"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text("Select Store", style: TextStyle(fontSize: 18)),
              const Text("Select a store to begin the safe audit"),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'lib/images/search.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Location',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
