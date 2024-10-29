import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({super.key});

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  String dropdownValue = 'Item 1';

  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down_outlined,color: Color.fromRGBO(10, 16, 61, 1.0),),
            iconSize: 24,
            elevation: 16,
            alignment: Alignment.bottomLeft,
            style: const TextStyle(color: Color.fromRGBO(10, 16, 61, 1.0)),
            underline: Container(
                height: 2,
                color: const Color.fromRGBO(10, 16, 61, 1.0),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
        ),
      ),
    );
  }
}
