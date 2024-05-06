abstract class ChatsCubitStates {}

class ChatsInitial extends ChatsCubitStates {}


class CreateChatsLoading extends ChatsCubitStates {}

class CreateChatsLoaded extends ChatsCubitStates {}

class CreateChatsError extends ChatsCubitStates {
  final String error;
  CreateChatsError({required this.error});
}


class GetChatsLoading extends ChatsCubitStates {}

class GetChatsLoaded extends ChatsCubitStates {}

class GetChatsError extends ChatsCubitStates {
  final String error;
  GetChatsError({required this.error});
}



