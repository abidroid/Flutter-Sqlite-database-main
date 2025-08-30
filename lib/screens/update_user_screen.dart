import 'package:flutter/material.dart';
import 'package:flutter_sqlite/db/database_helper.dart';
import 'package:flutter_sqlite/model/student.dart';
import 'package:flutter_sqlite/screens/users_lists_screen.dart';
import 'package:flutter_sqlite/widgets/custom_text_field.dart';
import 'package:flutter_sqlite/widgets/my_btn.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateUserScreen extends StatefulWidget {

  final Student student;
  UpdateUserScreen({super.key, required this.student});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final updateUserFormKey = GlobalKey<FormState>();

  String? name, mobile, course, totalFee, feePaid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Form(
            key: updateUserFormKey,
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  initialValue: widget.student.name,
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
                  initialValue: widget.student.mobile,
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
                  initialValue: widget.student.course,
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
                  initialValue: widget.student.totalFee.toString(),
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
                  initialValue: widget.student.feePaid.toString(),
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
                  text: "Update",
                  onPressed: () async {
                    if (updateUserFormKey.currentState!.validate()) {

                      Student s = Student(id: widget.student.id,  name: name!, mobile: mobile!, course: course!, totalFee: int.parse(totalFee!), feePaid: int.parse(feePaid!));

                      // call DatabaseHelper function to update student

                      int result = await DatabaseHelper.instance.updateStudent(s);

                      if( result > 0){
                        Fluttertoast.showToast(msg: 'Updated');
                        Navigator.of(context).pop(true);
                      }else{
                        Fluttertoast.showToast(msg: 'Failed');

                      }
                    }
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
