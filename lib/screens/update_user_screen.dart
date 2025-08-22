import 'package:flutter/material.dart';
import 'package:flutter_sqlite/screens/users_lists_screen.dart';
import 'package:flutter_sqlite/widgets/custom_text_field.dart';
import 'package:flutter_sqlite/widgets/my_btn.dart';

class UpdateUserScreen extends StatelessWidget {
  UpdateUserScreen({super.key});

  final updateUserFormKey = GlobalKey<FormState>();

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
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
                CustomTextField(
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
                  text: "Update",
                  onPressed: () {
                    if (updateUserFormKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersListsScreen(),
                        ),
                      );
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
