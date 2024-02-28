import 'package:flutter/material.dart';
import 'package:safe_audit_app/components/current_audit_card.dart';
import 'package:safe_audit_app/components/past_audit_card.dart';
import 'package:safe_audit_app/components/add_button.dart';

class SafeAudit extends StatefulWidget {
  const SafeAudit({super.key});

  @override
  State<SafeAudit> createState() => _SafeAuditState();
}

class _SafeAuditState extends State<SafeAudit>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF26467F),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                icon: Image.asset(
                  'lib/images/menu.png',
                  width: 26,
                  height: 22,
                ),
              ),
              centerTitle: true,
              title: const Text("Safe Audit",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Filter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 5,
                onTap: (index) {
                  setState(() {
                    _tabController.index = index;
                  });
                },
                tabs: [
                  const Tab(text: 'Current Audit'),
                  const Tab(text: 'Past Audit'),
                ],
              ),
            ),
            body: Builder(builder: (BuildContext context) {
              return Stack(
                children: [
                  TabBarView(
                    children: [
                      Container(
                        color: Colors.grey[300],
                        child: ListView.builder(
                          itemCount: auditData.length,
                          itemBuilder: (context, index) {
                            return CurrentAuditCard(
                              title: auditData[index]['title'] ?? '',
                              location: auditData[index]['location'] ?? '',
                              depositDate:
                                  auditData[index]['depositDate'] ?? '',
                              depositor: auditData[index]['depositor'] ?? '',
                              date: auditData[index]['date'] ?? '',
                            );
                          },
                        ),
                      ),
                      const PastAuditCard(),
                    ],
                  ),
                  _tabController.index == 0 ? const AddButton() : Container()
                ],
              );
            })),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  shape: BoxShape.rectangle,
                  color: _tabController.index == 1
                      ? const Color(0xFFDDE9FF)
                      : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/deposit.png',
                      width: 26,
                      height: 22,
                      color: _tabController.index == 1
                          ? const Color(0xFF26467F)
                          : const Color(0xFFA3A3A3),
                    ),
                    const SizedBox(width: 8),
                    Text("Deposits",
                        style: TextStyle(
                          color: _tabController.index == 1
                              ? const Color(0xFF26467F)
                              : const Color(0xFFA3A3A3),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 2),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  shape: BoxShape.rectangle,
                  color: _tabController.index == 0
                      ? const Color(0xFFDDE9FF)
                      : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/images/deposit.png',
                      width: 26,
                      height: 22,
                      color: _tabController.index == 0
                          ? const Color(0xFF26467F)
                          : Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Safe Audit",
                      style: TextStyle(
                        color: _tabController.index == 0
                            ? const Color(0xFF26467F)
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
