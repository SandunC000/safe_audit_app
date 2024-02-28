import 'package:flutter/material.dart';

class LocationText extends StatefulWidget {
  final String id;
  final String address;
  final bool isSelected;
  final Function(bool) onSelect;

  const LocationText({
    super.key,
    required this.id,
    required this.address,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  State<LocationText> createState() => _LocationTextState();
}

class _LocationTextState extends State<LocationText> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {
          widget.onSelect(!widget.isSelected);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.id} - ${widget.address}",
              style: const TextStyle(fontSize: 16, color: Color(0xFF344054)),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? const Color(0xFF26467F)
                    : const Color(0xFFEAF1FB),
                borderRadius: BorderRadius.circular(50),
              ),
              child: widget.isSelected
                  ? Image.asset(
                      'lib/images/tick.png',
                      width: 12,
                      height: 10,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
