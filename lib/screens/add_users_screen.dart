import 'package:flutter/material.dart';
import 'package:flutter_sqlite/db/database_helper.dart';
import 'package:flutter_sqlite/model/student.dart';
import 'package:flutter_sqlite/screens/users_lists_screen.dart';
import 'package:flutter_sqlite/widgets/custom_text_field.dart';
import 'package:flutter_sqlite/widgets/my_btn.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUsersScreen extends StatefulWidget {
  AddUsersScreen({super.key});

  @override
  State<AddUsersScreen> createState() => _AddUsersScreenState();
}

class _AddUsersScreenState extends State<AddUsersScreen> {
  final addUsersFormKey = GlobalKey<FormState>();

  // will hold the values entered into TextField
  String? name, mobile, course, totalFee, feePaid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add User"), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Form(
            key: addUsersFormKey,
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    }

                    name = value;
                    return null;
                  },
                ),
                CustomTextField(
                  keyboardType: TextInputType.phone,
                  hintText: "Mobile No",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your mobile no";
                    }
                    mobile = value;
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Course",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your course";
                    }
                    course = value;
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Total Fee",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter total fee";
                    }
                    totalFee = value;
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Paid Fee",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter paid fee";
                    }
                    feePaid = value;
                    return null;
                  },
                ),
                SizedBox(height: 40),
                MyBtn(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                  ),
                  text: "Save",
                  onPressed: () async {

                    if (addUsersFormKey.currentState!.validate()) {

                      Student student = Student(name: name!, mobile: mobile!, course: course!, totalFee: int.parse(totalFee!), feePaid: int.parse(feePaid!),);

                      // pass this student object to database
                      int result = await DatabaseHelper.instance.saveStudent(student);

                      if( result > 0 ){
                        Fluttertoast.showToast(msg: 'Record Saved');
                      }else{
                        Fluttertoast.showToast(msg: 'Record Failed');

                      }

                    }else{
                      Fluttertoast.showToast( msg: "Please provide all values");
                    }
                  },
                ),
                MyBtn(
                  text: "View All",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UsersListsScreen()),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
