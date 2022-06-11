import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Skills extends StatefulWidget {
  Skills({Key? key, required this.domainValue, required this.skillValue})
      : super(key: key);

  final String domainValue;
  final List<String> skillValue;

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SKILL SELECTION"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GFMultiSelect(
                items: widget.skillValue,
                onSelect: (value) {
                  print('selected $value ');
                },
                dropdownTitleTileText: '${widget.domainValue}',
                dropdownTitleTileColor: Colors.grey[200],
                dropdownTitleTileMargin:
                    EdgeInsets.only(top: 22, left: 18, right: 18, bottom: 5),
                dropdownTitleTilePadding: EdgeInsets.all(10),
                dropdownUnderlineBorder:
                    const BorderSide(color: Colors.transparent, width: 2),
                dropdownTitleTileBorder:
                    Border.all(color: Colors.grey, width: 1),
                dropdownTitleTileBorderRadius: BorderRadius.circular(5),
                expandedIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                collapsedIcon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.black54,
                ),
                submitButton: Text('OK'),
                dropdownTitleTileTextStyle:
                    const TextStyle(fontSize: 14, color: Colors.black54),
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(6),
                type: GFCheckboxType.basic,
                activeBgColor: Colors.green.withOpacity(0.5),
                inactiveBorderColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
