abstract class ChatLoginStates{}

class ChatLoginInitialState extends ChatLoginStates{}

class ChatLoginSuccessState extends ChatLoginStates{
  String userUID;

  ChatLoginSuccessState(this.userUID);
}

class ChatLoginErrorState extends ChatLoginStates{
  String error;

  ChatLoginErrorState(this.error);
}