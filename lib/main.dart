import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      home: TODOAPP(),
    ));

class TODOAPP extends StatefulWidget {
  @override
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String value;
  var listTODO = [''];
  addToDo(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  removeitem(int index) {
    setState(() {
      listTODO.remove(listTODO[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TODO APP"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Add Items"),
                    content: TextField(
                      onChanged: (val) {
                        value = val;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            setState(() {
                              listTODO.add(value);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"))
                    ],
                  );
                });
          },
        ),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Text("")
                  : Dismissible(
                      key: Key(listTODO[index]),
                      child: Card(
                          child: ListTile(
                              leading: Icon(Icons.assessment_rounded),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    removeitem(index);
                                  });
                                },
                              ),
                              title: Text(
                                listTODO[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))));
            }));
  }
}
