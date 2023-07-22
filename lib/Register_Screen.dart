import 'package:chatx/User_Model.dart';
import 'package:chatx/Home_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  bool x = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var unameController = TextEditingController();
  var phoneController = TextEditingController();
  var key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.tealAccent,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: key1,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 29,
                    color: Colors.indigoAccent,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: unameController,
                  validator: (e) {
                    if (e!.isEmpty) return 'user name is Empty';
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                    ),
                    hintText: 'User Name',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: phoneController,
                  validator: (e) {
                    if (e!.isEmpty) return 'Phone is Empty';
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                        width: 5.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                    ),
                    hintText: 'Phone',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (e) {
                    if (e!.isEmpty) return 'Email is Empty';
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.indigoAccent,
                        width: 5.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                    ),
                    hintText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (e) {
                    if (e!.isEmpty) return 'password is Empty';
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                    ),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child:
                    ElevatedButton(
                  onPressed: () {
                    if (key1.currentState!.validate()) {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: '${emailController.text}',
                          password: '${passwordController.text}'
                      ).then((value) {
                       // UserModel model =UserModel(emailController.text, phoneController.text, unameController.text, value.user?.uid);
                        print('done');
                       /* FirebaseFirestore
                            .instance
                            .collection('users')
                            .doc(value.user?.uid)
                            .set(model.tomap()).then((value) {
                              print('user created');
                              print(model.tomap());
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
                        }).catchError((e){
                          print(e);
                        });*/
                      }).catchError((e){
                        print('${e.toString()}');
                      });
                    }
                  },
                  child: Text('Regiest'),
                )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
