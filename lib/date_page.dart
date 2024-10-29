import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future _selectDate(BuildContext context) async => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2050),
      ).then((DateTime? selected) {
        if (selected != null && selected != _selectedDate) {
          setState(() {
            _selectedDate = selected;
            _dateController.text = DateFormat('MM/dd/yyyy').format(_selectedDate!);
          });
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 32,
          padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10,top: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            border: Border.all(
                color: const Color.fromRGBO(10, 16, 61, 1.0),
                width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Expanded(
                child: TextField(
                  controller: _dateController,
                  style: const TextStyle(color: Color.fromRGBO(10, 16, 61, 1.0)),
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                      hintText: 'MM/DD/YYYY',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontSize: 10, color: Color.fromRGBO(10, 16, 61, 1.0))),
                  readOnly: true,
                ),
              ),
              GestureDetector(
                  onTap: () => _selectDate(context),
                child: Icon(Icons.date_range),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
