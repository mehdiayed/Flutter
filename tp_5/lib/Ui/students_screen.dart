import 'package:flutter/material.dart';
import '../Models/list_etudiants.dart';
import '../Models/scol_list.dart';
import '../util/dbuse.dart';
import 'list_student_dialog.dart';

class StudentsScreen extends StatefulWidget {
  final ScolList scolList;

  StudentsScreen(this.scolList);
  @override
  _StudentsScreenState createState() => _StudentsScreenState(this.scolList);
}

class _StudentsScreenState extends State<StudentsScreen> {
  final ScolList scolList;

  _StudentsScreenState(this.scolList);

  dbuse helper = dbuse();
  List<ListEtudiants> students = [];
  ListStudentDialog dialog = new ListStudentDialog();
  @override
  Widget build(BuildContext context) {
    showData(this.scolList.codClass);
    return Scaffold(
      appBar: AppBar(
        title: Text(scolList.nomClass),
      ),
      body: ListView.builder(
          itemCount: (students != null) ? students.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(students[index].nom),
                onDismissed: (direction) {
                  String strName = students[index].nom;
                  helper.deleteStudent(students[index]);
                  setState(() {
                    students.removeAt(index);
                  });
                  Scaffold.of(context).showBottomSheet((BuildContext context) {
                    return Container(
                      height: 200,
                      color: Color.fromARGB(255, 0, 167, 167),
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
                  });
                },
                child: ListTile(
                  title: Text(students[index].nom),
                  subtitle: Text(
                      'Prenom: ${students[index].prenom} - Date Nais:${students[index].datNais}'),
                  onTap: () {},
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => dialog.buildAlert(
                              context, students[index], false));
                    },
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => dialog.buildAlert(
                context, ListEtudiants(0, scolList.codClass, '', '', ''), true),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Future showData(int idList) async {
    await helper.openDb();
    students = await helper.getEtudiants(idList);
    setState(() {
      students = students;
    });
  }
}
