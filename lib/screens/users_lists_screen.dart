import 'package:flutter/material.dart';
import 'package:flutter_sqlite/screens/update_user_screen.dart';
import 'package:flutter_sqlite/utils/delete_dialogue.dart';

class UsersListsScreen extends StatelessWidget {
  const UsersListsScreen({super.key});

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
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name      : Faiz Muhammad",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Mobile No : +92123456789",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Course    : Flutter",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Total Fee : 20,000",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Fee Paid  : 20,000",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateUserScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          DeleteDialogueBox(context);
                          },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
