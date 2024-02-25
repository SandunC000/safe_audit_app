import 'package:flutter/material.dart';
import 'package:safe_audit_app/pages/new_safe_audit.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const NewSafeAudit(),
            fullscreenDialog: true));
      },
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF26467F),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Image.asset(
          'lib/images/add.png',
          width: 26,
          height: 22,
        ),
      ),
    );
  }
}
