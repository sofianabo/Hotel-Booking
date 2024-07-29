import 'package:flutter/material.dart';
import 'package:hotel/Providers/SelectionDropDownList.dart';
import 'package:provider/provider.dart';

class dropdowncutom extends StatefulWidget {
  const dropdowncutom({super.key});

  @override
  State<dropdowncutom> createState() => _dropdowncutomState();
}

class _dropdowncutomState extends State<dropdowncutom> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      autofocus: false,
      underline: const Text(
        '',
        style: TextStyle(color: Colors.white),
      ),
      borderRadius: BorderRadius.circular(10),
      iconEnabledColor: const Color.fromARGB(255, 76, 77, 220),
      style: const TextStyle(color: Colors.black),
      value: Provider.of<SelectionDropDownList>(context , listen: false).item,
      onChanged: (newValue) {
       setState(() {
         Provider.of<SelectionDropDownList>(context , listen: false).SetValue(newValue!);
       });
      },
      isExpanded: true,
      items: <String>[
        'Hollywood Twin Room',
        'Sweet',
        'Super Delux',
        'Double-double',
        'Studio'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

