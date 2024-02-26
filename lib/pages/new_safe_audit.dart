import 'package:flutter/material.dart';
import 'package:safe_audit_app/components/secondary_app_bar.dart';
import 'package:safe_audit_app/components/location_text.dart';
import 'package:safe_audit_app/pages/start_safe_audit.dart';

class NewSafeAudit extends StatefulWidget {
  const NewSafeAudit({super.key});

  @override
  State<NewSafeAudit> createState() => _NewSafeAuditState();
}

class _NewSafeAuditState extends State<NewSafeAudit> {
  List<LocationInfo> locations = [
    LocationInfo(id: '300400', address: 'Jonestown Road'),
    LocationInfo(id: '331197', address: 'Metropolitan Ave'),
    // Add more locations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SecondaryAppBar(title: "Start New Safe Audit"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text("Select Store",
                    style: TextStyle(fontSize: 18, color: Color(0xFF344054))),
                const Text(
                  "Select a store to begin the safe audit",
                  style: TextStyle(color: Color(0xFF667085)),
                ),
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
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return LocationText(
                        id: locations[index].id,
                        address: locations[index].address,
                      );
                    }),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StartSafeAudit(),
                        fullscreenDialog: true));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    color: const Color(0xFF004385),
                    child: const Center(child: Text('Apply' , style: TextStyle(color: Colors.white ),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LocationInfo {
  final String id;
  final String address;

  LocationInfo({
    required this.id,
    required this.address,
  });
}
