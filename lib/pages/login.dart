import 'package:classadmin/pages/LoginForms/stdentform.dart';
import 'package:classadmin/pages/LoginForms/teacherlogin.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        color: Colors.grey[900],
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const StudentForm()));
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:BorderRadius.circular(50),
                  ),
                  child:const Text("Student Login",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TeacherLogin()));

              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 30),
                height: 50,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius:BorderRadius.circular(50),
                ),
                child:const Text("Teacher Login",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),),
              ),
            ),          ],
        ),
      ),
    );
  }
}
