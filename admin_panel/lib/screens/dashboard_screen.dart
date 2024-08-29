import 'package:admin_panel/screens/pending_screen.dart';
import 'package:admin_panel/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String fullName = 'Jhon R-niel Ebuan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Dashboard')),
        drawer: Drawer(
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Pending Request'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PendingScreen()));
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('User List',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return CustomContainer(fullName: fullName,
                  showIcon: true,);
                  
                },
              ),
            ),
          ],
        ));
  }
}
