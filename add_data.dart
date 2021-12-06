import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //
  CollectionReference data = FirebaseFirestore.instance.collection('data');

  //
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //
  @override
  void initState() {
    super.initState();
  }

  //
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text('Add data '),
      ),
      //
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Name
          TextField(
            controller: nameController,
            textCapitalization: TextCapitalization.words,
            //
            decoration: InputDecoration(
              hintText: 'Name',
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Email
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            //
            decoration: InputDecoration(
              hintText: 'Email',
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),

          SizedBox(height: 16),

          //Add Button
          ElevatedButton(
            child: Text('Add Data'),
            onPressed: () {
              addData();
            },
          ),
        ],
      ),
    );
  }

  Future<void> addData() async {
    String name = nameController.text;
    String email = emailController.text;

    await data.add({
      'name': name,
      'email': email,
    });

    //
    nameController.clear();
    emailController.clear();
  }
}
