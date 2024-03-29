import 'package:flutter/material.dart';
import 'package:safe_audit_app/components/break_down_tab.dart';
import 'package:safe_audit_app/components/by_total_tab.dart';
import 'package:safe_audit_app/components/save_audit_button.dart';
import 'package:safe_audit_app/components/secondary_app_bar.dart';

class StartSafeAudit extends StatefulWidget {
  const StartSafeAudit({super.key});

  @override
  State<StartSafeAudit> createState() => _StartSafeAuditState();
}

class _StartSafeAuditState extends State<StartSafeAudit> {
  double breakDownTotal = 0.0;
  String byTotalEnteredTotal = '';
  int currentTabIndex = 0;

  double _parseTotal(String input) {
    try {
      return double.parse(input);
    } catch (e) {
      return 0.0; // Set a default value in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const SecondaryAppBar(
          title: 'Start Safe Audit',
        ),
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0x7676801F).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          currentTabIndex = index;
                        });
                      },
                      tabs: const [
                        Tab(text: "By Break Down"),
                        Tab(text: "By Total"),
                      ],
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: const Color(0x7676801F).withOpacity(0.12),
                              width: 5)),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  children: [
                    BreakDownTab(
                      onTotalChanged: (value) {
                        setState(() {
                          breakDownTotal = value;
                        });
                      },
                    ),
                    ByTotalTab(
                      onTotalChanged: (value) {
                        setState(() {
                          byTotalEnteredTotal = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Divider(),
              SaveAuditButton(
                total: currentTabIndex == 0
                    ? breakDownTotal
                    : _parseTotal(byTotalEnteredTotal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
