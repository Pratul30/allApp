import 'package:flutter/material.dart';
import 'package:test_app_1/screens/skills.dart';

import '../widgets/dropdown.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String domainValue = "Electrical Engineering";
  List<String> skillValue = [];

  List<String> domains = [
    "Electrical Engineering",
    "Mechanical Engineering",
  ];

  List<String> electricalSkill = [
    "Project Management",
    "Engineering Design",
    "AutoCAD",
    "Matlab",
    "Controllers"
  ];

  List<String> mechanicalSkill = [
    "Six Sigma",
    "Basic Mechanical Concepts",
    "Mathematics",
    "Creativity"
  ];

  List<String> getSkill(String domainValue) {
    return domainValue == domains[0] ? electricalSkill : mechanicalSkill;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: DropdownWidget(
                  title: "Domains",
                  items: domains,
                  itemCallBack: (String? newValue) {
                    domainValue = newValue!;
                  },
                  currentItem: "Electrical Engineering",
                  hintText: "Domain",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              width: deviceSize.width,
              height: deviceSize.height * 0.12,
              child: ElevatedButton(
                onPressed: () {
                  if (domainValue == domains[0]) {
                    skillValue = electricalSkill;
                  } else {
                    skillValue = mechanicalSkill;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Skills(
                        domainValue: domainValue,
                        skillValue: skillValue,
                      ),
                    ),
                  );
                },
                child: Text(
                  'NEXT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
