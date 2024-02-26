import 'package:flutter/material.dart';
import 'package:safe_audit_app/components/secondary_app_bar.dart';

class StartSafeAudit extends StatefulWidget {
  const StartSafeAudit({super.key});

  @override
  State<StartSafeAudit> createState() => _StartSafeAuditState();
}

class _StartSafeAuditState extends State<StartSafeAudit> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SecondaryAppBar(title: 'Start Safe Audit'),
      // body:  ,
    );
  }
}
