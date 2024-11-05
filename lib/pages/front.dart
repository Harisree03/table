import 'package:flutter/material.dart';

class tablepage extends StatefulWidget {
  const tablepage({super.key});

  @override
  State<tablepage> createState() => _tablepageState();
}

class _tablepageState extends State<tablepage> {
  List<Map<String, String>> rows = [
    {'names': '', 'description': '', ' ': ' '}
  ];

  void _add(int index, String s, String newValue) {
    setState(() {
      rows.add({'names': '', 'description': ''});
    });
  }

  void _delete(int index) {
    setState(() {
      rows.removeAt(index);
    });
  }

  void _edit(int index, String key, String newValue) {
    setState(() {
      rows[index][key] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: [
              DataColumn(label: Text('name')),
              DataColumn(label: Text('description')),
              DataColumn(label: Text(' ')),
            ],
            rows: List.generate(rows.length, (index) {
              return DataRow(cells: [
                DataCell(TextFormField(
                  initialValue: rows[index]['name'],
                  onChanged: (newValue) {
                    // _add(index, 'name', newValue);
                  },
                )),
                DataCell(TextFormField(
                  initialValue: rows[index]['name'],
                  onChanged: (newValue) {
                    // _add(index, 'name', newValue);
                  },
                )),
                DataCell(Row(
                  children: [
                    IconButton(
                        onPressed: () => _add(index, 'name', 'description'),
                        icon: Icon(Icons.add)),
                    IconButton(
                        onPressed: () => _delete(index),
                        icon: Icon(Icons.delete)),
                    IconButton(onPressed: () => _edit, icon: Icon(Icons.edit)),
                  ],
                ))
              ]);
            })),
      ),
    );
  }
}
