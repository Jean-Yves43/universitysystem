import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({Key? key});

  @override
  State<Account> createState() => _AccountState();
}

List<String> name = [
  'Manouan Jean-yves',
  'Dosso Marienne',
  'Konan Brandon',
  'Nguessan Yapi',
  'Mbazumutima Teddy',
];

List<String> id = ['106077', '105098', '105034', '109773', '107466'];

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) => Card(
          elevation: 5.0,
          margin: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(name[index]),
              subtitle: Text(id[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Handle edit action
                      _editAccount(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete action
                      _deleteAccount(index);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add account action
          _addAccount();
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addAccount() {
    // Implement functionality to add a new account
    print('Add account');
  }

  void _editAccount(int index) {
    // Implement functionality to edit an account
    print('Edit account: ${name[index]}');
  }

  void _deleteAccount(int index) {
    // Implement functionality to delete an account
    print('Delete account: ${name[index]}');
  }
}

void main() {
  runApp(MaterialApp(
    home: Account(),
  ));
}
