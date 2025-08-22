import 'package:flutter/material.dart';
import 'package:flutter_sqlite/screens/users_lists_screen.dart';
import 'package:flutter_sqlite/widgets/custom_text_field.dart';
import 'package:flutter_sqlite/widgets/my_btn.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUsersScreen extends StatelessWidget {
  AddUsersScreen({super.key});

  final addUsersFormKey = GlobalKey<FormState>();

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
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Course",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your course";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Total Fee",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter total fee";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Paid Fee",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter paid fee";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                MyBtn(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green
                  ),
                  text: "Save",
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Record will be saved');

                    if (addUsersFormKey.currentState!.validate()) {
                      Fluttertoast.showToast(msg: 'Record will be saved');
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
