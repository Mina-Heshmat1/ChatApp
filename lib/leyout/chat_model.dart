
class ChatModel{
  late String msg;
  late String time ;
  late String senderID ;
  late String recverID ;
  late String image ;

  ChatModel(
      {required this.msg,
       required this.time,
       required this.senderID,
       required this.recverID,
       required this.image,
      });

  ChatModel.fromJson(Map<String , dynamic>json){
    if (json == null)
    {
      return ;
    }
    msg = json['msg'];
    time = json['time'];
    senderID = json['senderID'];
    recverID = json['recverID'];
    image = json['image'];
  }

  Map<String ,dynamic>toJson()
  {
    return {
      'msg' : msg ,
      'time' : time,
      'senderID' : senderID ,
      'recverID' : recverID ,
      'image' : image ,
    };

  }
}

//علاشان ارفع الداتا