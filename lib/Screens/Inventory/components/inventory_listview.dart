import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scmes_lite/Models/users.dart';
import 'package:scmes_lite/Services/auth.dart';

List<String> course = ['c', 'c++', 'java', 'kotlin', 'objective-c', 'swift', 'php', 'php', 'php', 'php', 'php'];

class InventoryListView extends StatefulWidget {
  const InventoryListView({Key? key}) : super(key: key);

  @override
  State<InventoryListView> createState() => _InventoryListViewState();
}

class _InventoryListViewState extends State<InventoryListView> {
  final AuthService authService = AuthService();

  int selectedIndex = -1;
  late final List<Users> users;
  Map<String, dynamic>? map;
  List<dynamic>? data;
  var isSelected = false;
  void getJsonData() async {
    String jsonText =
        '{ "serviceId" : "SYS_View_User_List","procCode" : "1","inMsg" : {"userId" : "shchae","password" : "0"}';
    var res = await authService.login(jsonText);

    setState(() {
      map = jsonDecode(utf8.decode(res!.bodyBytes));
      data = map!["getUser"];
      print(data);
      for (var element in data!) {
        Map obj = element;
        String name = obj['Name'];
        print(name);
      }
      print("${data![0]["ID"]}"); // jhpark
      print("${data![1]["ID"]}");
    });
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: data == null ? 0 : data!.length,
      itemBuilder: (context, index) {
        return ListTile(
          //tileColor: Colors.black,
          leading: Icon(Icons.info),
          title: Text(data![index]["ID"]),
          subtitle: Text(data![index]["Name"]),
          trailing: new Text("3"),
          onTap: () {
            print('클릭됨 ${index}');
            toggleSelection();
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
        );
      },
    );
  }

  void toggleSelection() {
    setState(() {
      if (isSelected) {}
    });
  }

  /*@override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: course.length,
      itemCount: users.isEmpty ? 0 : users.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Card(
            */ /*shape: (selectedIndex == position)
                ? new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.red.shade100, width: 2.0),
                    borderRadius: BorderRadius.circular(4.0))
                : new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(4.0)),*/ /*
            color: (selectedIndex == index) ? Colors.red[100] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                users[index].id.toString(),
                //course[position],
              ),
            ),
          ),
          onTap: () => setState(() => selectedIndex = index),
        );
      },
    );
  }*/
}
