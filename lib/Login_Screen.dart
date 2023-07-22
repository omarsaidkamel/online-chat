import 'package:chatx/Register_Screen.dart';
import 'package:chatx/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  var emailEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();
  var key2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        backgroundColor: Colors.tealAccent,
        body: Padding(
          padding: const EdgeInsets.only(right: 15.0,left: 15.0,bottom: 15.0),
          child: Form(
            key: key2,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'ChatX',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize:100,
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize:29,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    validator: (e){
                      if(e!.isEmpty)return 'Email is Empty';
                    },
                    controller: emailEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.indigoAccent, width: 5.0,),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                      ),
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    validator: (e){
                      if(e!.isEmpty)return 'Password is Empty';
                    },
                    controller: passwordEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.indigoAccent, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.indigo, width: 5.0),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You Don\'t  have account?'),
                      TextButton(
                        child: Text('Register'),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>RegisterScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  Center(child: ElevatedButton(onPressed: (){
                    if(key2.currentState!.validate()){
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailEditingController.text,
                          password: passwordEditingController.text
                      ).then((value){
                        print('Login Done');
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen()),(route)=>false);
                      }).catchError((e){
                        print('${e.toString()}');
                      });
                    }
                  }, child: Text('Login'))),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
    );
  }
}