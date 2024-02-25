import 'package:flutter/material.dart';
import 'package:safe_audit_app/components/main_app_bar.dart';

class NewSafeAudit extends StatefulWidget {
  const NewSafeAudit({super.key});

  @override
  State<NewSafeAudit> createState() => _NewSafeAuditState();
}

class _NewSafeAuditState extends State<NewSafeAudit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "Start New Safe Audit"),
    );
  }
}
