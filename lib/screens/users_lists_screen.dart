import 'package:flutter/material.dart';
import 'package:flutter_sqlite/db/database_helper.dart';
import 'package:flutter_sqlite/model/student.dart';
import 'package:flutter_sqlite/screens/update_user_screen.dart';
import 'package:flutter_sqlite/utils/delete_dialogue.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UsersListsScreen extends StatefulWidget {
  const UsersListsScreen({super.key});

  @override
  State<UsersListsScreen> createState() => _UsersListsScreenState();
}

class _UsersListsScreenState extends State<UsersListsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Student>>(
        future: DatabaseHelper.instance.getAllStudents(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Student> students = snapshot.data;
            if (students.isEmpty) {
              return Center(child: Text('No Records Found'));
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.amber[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID: ${students[index].id}', style: TextStyle(fontSize: 30),),

                          Text('Name: ${students[index].name}', style: TextStyle(fontSize: 30),),
                          Text('Course: ${students[index].course}', style: TextStyle(fontSize: 30),),
                          Text('Mobile: ${students[index].mobile}', style: TextStyle(fontSize: 30),),
                          Text('T Fee: ${students[index].totalFee}', style: TextStyle(fontSize: 30),),
                          Text('Fee P: ${students[index].feePaid}', style: TextStyle(fontSize: 30),),
                          Row(
                            children: [
                              Expanded(child: ElevatedButton(onPressed: (){

                                showDialog(context: context,
                                    builder: (context){
                                   return AlertDialog(
                                     title: const Text('Confirmation'),
                                     content: const Text("Are you sure to delete ?"),
                                     actions: [
                                       TextButton(onPressed: (){
                                         Navigator.of(context).pop();
                                       }, child: const Text("No")),
                                       TextButton(onPressed: () async{
                                         Navigator.of(context).pop();
                                         // Delete Logic here

                                         int result = await DatabaseHelper.instance
                                             .deleteStudent(students[index].id!);

                                         if( result > 0){
                                           Fluttertoast.showToast(msg: 'Deleted');

                                           setState(() {

                                           });
                                         }else{
                                           Fluttertoast.showToast(msg: 'Failed');

                                         }
                                       }, child: const Text("Yes")),
                                     ],
                                   );
                                });

                              }, child: const Text('Delete'))),

                              Expanded(child: ElevatedButton(onPressed: () async {

                                Student s = students[index];

                                bool? updated = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                  return UpdateUserScreen(student: s);
                                }));

                                if( updated != null && updated){
                                  setState(() {

                                  });
                                }

                              }, child: const Text('Edit'))),
                            ],
                          )
                        ],
                      ),
                    ),
                    );
                  },
                ),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
