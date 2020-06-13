class User {

  final String uid;

  User({this.uid});

}

class UserDataUserType {

  final String uid;
  final String name;
  final String userType;

  UserDataUserType({this.uid,this.name,this.userType});

}

class UserData {

  final String uid;
  final String name;
  final String userType;
  final String address;

  UserData({this.uid,this.name,this.userType,this.address});
} 

class UserType {

  final String userType;

  UserType({this.userType});


}