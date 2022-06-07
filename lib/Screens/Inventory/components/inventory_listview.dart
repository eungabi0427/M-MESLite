import 'package:flutter/material.dart';

List<String> course = ['c', 'c++', 'java', 'kotlin', 'objective-c', 'swift', 'php', 'php', 'php', 'php', 'php'];

class InventoryListView extends StatefulWidget {
  const InventoryListView({Key? key}) : super(key: key);

  @override
  State<InventoryListView> createState() => _InventoryListViewState();
}

class _InventoryListViewState extends State<InventoryListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: course.length,
      itemBuilder: (context, position) {
        return InkWell(
          child: Card(
            /*shape: (selectedIndex == position)
                ? new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.red.shade100, width: 2.0),
                    borderRadius: BorderRadius.circular(4.0))
                : new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(4.0)),*/
            color: (selectedIndex == position) ? Colors.red[100] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                course[position],
              ),
            ),
          ),
          onTap: () => setState(() => selectedIndex = position),
        );
      },
    );
  }
}
