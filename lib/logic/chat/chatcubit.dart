import 'package:bloc/bloc.dart';
import 'package:chat_app/logic/chat/chatstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ChatCubit extends Cubit<ChatsCubitStates> {
  ChatCubit() : super(ChatsInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController createMessageController = TextEditingController();

  void createMessage(){
    emit(CreateChatsLoading());
    try{
      CollectionReference messages = FirebaseFirestore.instance.collection('messages');
      messages.add({
        "title" : createMessageController.text.trim()
      });
      emit(CreateChatsLoaded());

    } catch (ex){
         print(ex.toString());
         emit(CreateChatsError(error: ex.toString()));
    }
  }

  void getMessage()async{
    emit(GetChatsLoading());
    try{
      CollectionReference messages = FirebaseFirestore.instance.collection('messages');
     //await messages.get();
      messages.snapshots().listen((event) {
        event.docs.forEach((element) {
          print(element.data());
        });
      });
      //print(messages.doc());
      emit(GetChatsLoaded());

    } catch (ex){
      print(ex.toString());
      emit(GetChatsError(error: ex.toString()));
    }
  }



}
