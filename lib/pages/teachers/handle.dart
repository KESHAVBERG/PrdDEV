import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Handles extends StatefulWidget {
  final String id;

  const Handles({Key? key, required this.id}) : super(key: key);

  @override
  _HandlesState createState() => _HandlesState();
}

class _HandlesState extends State<Handles> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your classes"),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection("classes")
            .doc(widget.id)
            .collection("handles")
            .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
    return Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
    return Text("Loading");
    }

    return ListView(
    children: snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Text(data['class'], style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),),
    );
    }).toList(),
    );}
    )
      ),
    );
  }
}
