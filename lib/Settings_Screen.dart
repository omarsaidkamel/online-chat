import 'package:chatx/User_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late UserModel model;bool x = false;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore
        .instance
        .collection('users')
        .doc('gBDHwbLDjfSnctOZxLgzWfYmSsa2')
        .get().then((value) {
      print(value.data());
      x=true;
      model = UserModel.fromjson(value.data());
      setState(() {});
    }).catchError((e){
      print(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return x == false
        ?Center(child: CircularProgressIndicator())
        :Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Image.network(
                      width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                        '${model.imagecover}'
                    ),
                    Container(
                      color: Colors.blue,
                      height: 30,
                      width: double.infinity,
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 40,
                      backgroundImage: NetworkImage('${model.imageprofile}'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                '${model.name}',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 7,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:ReadMoreText(
                  '${model.bio}',
                  trimLines: 5,
                  colorClickableText: Colors.black,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                      color: Colors.purple,
                      fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('100',
                        style: TextStyle(
                            color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text('Posts',
                            style: TextStyle(color: Colors.purple,fontSize: 15,),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('255',
                        style: TextStyle(
                            color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text('Photos',
                            style: TextStyle(color: Colors.purple,fontSize: 15,),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('10K',
                        style: TextStyle(
                            color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text('Followers',
                            style: TextStyle(color: Colors.purple,fontSize: 15,),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('50',
                        style: TextStyle(
                            color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text('Following',
                            style: TextStyle(color: Colors.purple,fontSize: 15,),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
