class UserModel{
 late String fullName;
 late String emailAddress;
 late String PhoneNumber;
 late String userID;
//البسور ليس لهو حفظ فى databes

 UserModel({
   required this.fullName,
   required this.emailAddress,
   required this.PhoneNumber,
   required this.userID,
 });

 UserModel.fromjson(Map<String,dynamic>json){
   if(json==null)
   {
     return;
   }
   fullName=json['fullName'];
   emailAddress=json['emailAddress'];
   PhoneNumber=json['PhoneNumber'];
   userID=json['userID'];
 }

  Map<String,dynamic> toJson()
  {
    return{
      'fullName':fullName,
      'emailAddress':emailAddress,
      'PhoneNumber':PhoneNumber,
      'userID':userID,
    };

  }
}
