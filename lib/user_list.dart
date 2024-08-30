import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  void addUser(user) {
    final state = UserListState();
    state.addUser(user);
  }

  @override
  UserListState createState() => UserListState();
}

class UserListState extends State<UserList> {
  final _users = [];

  void addUser(user) {
    setState(() {
      _users.add(user);
    });
  }

  void addUsers(users) {
    setState(() {
      _users.addAll(users);
    });
  }

  void removeUser(String id) {
    setState(() {
      _users.removeWhere((user) => user.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.iconUrl),
                ),
                title: Text(user.name),
              );
            },
          ),
        ],
      ),
    );
  }
}
