import 'dart:convert';

import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'employees.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Fetch content from the json file
  List<Employees> _allEmployees = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readData();
  }

  void _readData() {
    readJson().then((list) {
      setState(() {
        _allEmployees = list;
      });
    });
  }

  Future<List<Employees>> readJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/employees.json');
      List<dynamic> employeeData = await json.decode(response);

      List<Employees> employeeList =
          employeeData.map((e) => Employees.fromJson(e)).toList();
      employeeList.sort((a, b) {
        return a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase());
      });
      return employeeList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Employee List',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: AlphabetScrollView(
          list: _allEmployees.map((e) => AlphaModel(e.firstName)).toList(),
          unselectedTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color:
                  _allEmployees.length > 5 ? Colors.black : Colors.transparent),
          selectedTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:
                  _allEmployees.length > 5 ? Colors.red : Colors.transparent),
          itemBuilder: (context, index, id) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(_allEmployees[index].imageUrl),
                ),
                title: Text(
                    '${_allEmployees[index].firstName} ${_allEmployees[index].lastName}'),
                onTap: () => Navigator.pushNamed(
                  context,
                  '/employee-details',
                  arguments: jsonEncode(_allEmployees[index]),
                ),
              ),
            );
          }),
      // Container(
      //   padding: const EdgeInsets.all(10),
      //   child: _allEmployees.isNotEmpty
      //       ? ListView.builder(
      //           itemCount: _allEmployees.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               elevation: 10,
      //               child: ListTile(
      //                 leading: CircleAvatar(
      //                   backgroundImage:
      //                       NetworkImage(_allEmployees[index].imageUrl),
      //                 ),
      //                 title: Text(
      //                     '${_allEmployees[index].firstName} ${_allEmployees[index].lastName}'),
      //                 onTap: () => Navigator.pushNamed(
      //                   context,
      //                   '/employee-details',
      //                   arguments: jsonEncode(_allEmployees[index]),
      //                 ),
      //               ),
      //             );
      //           })
      //       : Container(),
      // ),
    );
  }
}
