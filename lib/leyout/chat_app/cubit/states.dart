abstract class ChatStates{}

class ChatInitialState extends ChatStates{}

class ChatGetAllUserSuccessState extends ChatStates{}

class SendMsgSuccessState extends ChatStates{}

class UplodeImageSuccessState extends ChatStates{}

class ChatGetAllMsgState extends ChatStates{}

class ChatGetSearchSuccessState extends ChatStates{}

class ChatGetAllUserErrorState extends ChatStates{
  String error;

  ChatGetAllUserErrorState(this.error);
}

class SendMsgErrorState extends ChatStates{
  String error;

  SendMsgErrorState(this.error);
}

class UplodeImageErrorState extends ChatStates{
  String error;

  UplodeImageErrorState(this.error);
}

