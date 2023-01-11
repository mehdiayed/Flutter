import 'package:flutter/material.dart';
import 'package:tp_5/util/dbuse.dart';

import 'Models/list_etudiants.dart';
import 'Models/scol_list.dart';
import 'package:tp_5/Ui/students_screen.dart';

import 'Ui/scol_list_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShList(),
      ),
    );
  }
}

class ShList extends StatefulWidget {
  @override
  _ShListState createState() => _ShListState();
}

class _ShListState extends State<ShList> {
  List<ScolList> scolList = [];

  dbuse helper = dbuse();
  ScolListDialog dialog = ScolListDialog();

  @override
  void initState() {
    dialog = ScolListDialog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
        appBar: AppBar(
          title: Text(' Classes list'),
        ),
        body: ListView.builder(
            itemCount: (scolList != null) ? scolList.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(scolList[index].nomClass),
                  onDismissed: (direction) {
                    String strName = scolList[index].nomClass;
                    helper.deleteList(scolList[index]);
                    setState(() {
                      scolList.removeAt(index);
                    });
                    Scaffold.of(context).showBottomSheet(
                      (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Color.fromARGB(255, 0, 165, 165),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("$strName deleted"),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),

                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StudentsScreen(scolList[index])),
                        );
                      },
                      title: Text(scolList[index].nomClass),
                      leading: CircleAvatar(
                        child: Text(scolList[index].codClass.toString()),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      )));
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    dialog.buildDialog(context, ScolList(0, '', 0), true),
              );
            },
            child: Icon(Icons.add),
            backgroundColor: Color.fromARGB(255, 34, 0, 128)));
  }

  Future showData() async {
    await helper.openDb();

    ScolList list1 = ScolList(11, "DSI31", 30);
    int ClassId1 = await helper.insertClass(list1);
    ScolList list2 = ScolList(12, "DSI32", 26);
    int ClassId2 = await helper.insertClass(list2);
    ScolList list3 = ScolList(13, "DSI33", 28);
    int ClassId3 = await helper.insertClass(list3);
    String datee = '22-04-2021';
    ListEtudiants etud =
        ListEtudiants(1, ClassId1, "Ali", "Ben Mohamed", datee);
    int etudId1 = await helper.insertEtudiants(etud);

    etud = ListEtudiants(2, ClassId2, "Salah", "Ben Salah", datee);
    etudId1 = await helper.insertEtudiants(etud);
    etud = ListEtudiants(3, ClassId2, "Slim", "Ben Slim", datee);
    etudId1 = await helper.insertEtudiants(etud);
    etud = ListEtudiants(4, ClassId3, "Foulen", "Ben Foulen", datee);
    etudId1 = await helper.insertEtudiants(etud);
    scolList = await helper.getClasses();
    setState(() {
      scolList = scolList;
    });
  }
}
