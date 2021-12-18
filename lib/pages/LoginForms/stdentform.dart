import 'package:classadmin/Auth/auth.dart';
import 'package:classadmin/pages/dashbords/studentdashbord.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Student Login"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: h,
          width: w,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: emailController,
                  validator: (val){
                    if(val!.isEmpty){
                      return "enter your email";
                    }else if(!val.contains("@")){
                      return "enter a vail Email";
                    }else{
                      return null;
                    }
                  },
                  decoration:const InputDecoration(
                    hintText:"email",
                    hintStyle: TextStyle(
                      color: Colors.white
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  controller: passwordController,

                  validator: (val){
                    if(val!.isEmpty){
                      return "enter your password";
                    }else if(val.length<6){
                      return "more than 6 chars";
                    }else{
                      return null;
                    }
                  },
                  decoration:const InputDecoration(
                    hintText:"password",
                    hintStyle: TextStyle(
                        color: Colors.white
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      Auth().signIn(emailController.text, passwordController.text).then((value) {
                        FirebaseAuth.instance.authStateChanges()
                            .listen((User? user) {
                          if(user != null){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDashBoard(email: emailController.text,)));
                          }
                        });
                      });

                    }
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
                    child:const Text("Login",style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
