abstract class ChatSingUpStates{}

class ChatSingUpInitialState extends ChatSingUpStates{}

class ChatSingUpSuccessState extends ChatSingUpStates{}

class ChatCreateUserSuccessState extends ChatSingUpStates{}


class ChatSingUpErrorState extends ChatSingUpStates{
  String error;

  ChatSingUpErrorState(this.error);
}

class ChatCreateUserErrorState extends ChatSingUpStates{
  String error;

  ChatCreateUserErrorState(this.error);
}