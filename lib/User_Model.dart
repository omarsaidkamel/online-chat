class UserModel{
  late String phone;
  late String name;
  late String email;
  late String imagecover;
  late String imageprofile;
  late String bio;
  String? uid;

  //UserModel(this.email,this.phone,this.name,this.uid,this.imageprofile,this.imagecover);

  UserModel.fromjson(Map<String,dynamic>? M){
    email = M!['email'];
    name = M['name'];
    imagecover = M['imagecover'];
    imageprofile = M['imageprofile'];
    uid = M['uid'];
    bio = M['bio'];
    phone = M['phone'];
  }

  Map<String,dynamic> tomap(){
    return {
      'name':name,
      'phone':phone,
      'imageprofile':imageprofile,
      'imagecover':imagecover,
      'uid':uid,
      'bio':bio,
      'email':email,
    };
  }

}