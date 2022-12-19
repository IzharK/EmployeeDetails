import 'dart:convert';

import 'package:employee_data/employees.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({Key? key}) : super(key: key);

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  var employeeName = '';
  Employees? _employees;

  @override
  void didChangeDependencies() {
    var employeeString = ModalRoute.of(context)?.settings.arguments as String;
    var employeeJson = jsonDecode(employeeString);
    setState(() {
      _employees = Employees.fromJson(employeeJson);
      employeeName = _employees!.firstName;
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$employeeName ${_employees!.lastName}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 10,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  _employees!.imageUrl,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        left: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '$employeeName ${_employees!.lastName}',
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        left: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          _employees!.email,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        left: 8,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          _employees!.contact,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Age: ${_employees!.age.toString()}',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Date of birth: ${_employees!.dateOfBirth}',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Salary: ${_employees!.salary}',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Address: ${_employees!.address}',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
