import 'package:flutter/material.dart';
import 'package:safe_audit_app/pages/safe_audit.dart';
import 'package:safe_audit_app/pages/start_safe_audit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartSafeAudit(),
    );
  }
}
