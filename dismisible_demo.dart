import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shreya_demo/dismisiable/model_class.dart';

class DismisibleDemo extends StatelessWidget {
  //
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(title: Text('Dismisible Demo')),

      //
      body: StreamBuilder(
        stream: collectionReference.snapshots(),
        //
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            //
            itemBuilder: (BuildContext context, int index) {
              ModelClass data =
                  ModelClass.fromDocumentSnapshot(snapshot.data.docs[index]);
              return Dismissible(
                key: Key(data.id),
                child: ListTile(
                  //
                  leading: CircleAvatar(
                    child: Text('${data.name[0].toUpperCase()}'),
                  ),
                  //
                  title: Text('${data.name}'),
                  //
                  subtitle: Text('${data.email}'),
                ),
                //
                onDismissed: (DismissDirection direction) {
                  delete(data, context);
                },

                //
                background: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [Icon(Icons.delete), Icon(Icons.delete)],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> delete(ModelClass data, BuildContext context) async {
    // delete data
    await collectionReference.doc(data.id).delete();

    // show snackBar

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${data.name} deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () async {
            await collectionReference.doc(data.id).set(data.toMap());
          },
        ),
      ),
    );
  }
}
