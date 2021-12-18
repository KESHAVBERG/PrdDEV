import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherDashBord extends StatefulWidget {
  final String email;

  const TeacherDashBord({Key? key, required this.email}) : super(key: key);

  @override
  _TeacherDashBordState createState() => _TeacherDashBordState();
}

class _TeacherDashBordState extends State<TeacherDashBord> {
  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection("Teachers")
                .doc(widget.email)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Something went wrong',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ));
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text(
                        data['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        data['email'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      leading: Text(
                        data['id'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Classes you handle",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text("upload Assingment",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),)),
                    TextButton(
                        onPressed: () {}, child: const Text("Add Exam Link",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),)),
                  ],
                );
              }
              return Text("Loadin");
            },
          ),
        ));
  }
}
