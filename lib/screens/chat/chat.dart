import 'package:chat_app/logic/chat/chatcubit.dart';
import 'package:chat_app/logic/chat/chatstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChatCubit()..getMessage(),

      child: BlocConsumer<ChatCubit,ChatsCubitStates>(
        listener: (context,state){
          if(state is CreateChatsLoaded){
            ChatCubit.get(context).createMessageController.clear();
          }
        },
        builder: (context,state){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    'المحادثات',
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                    ),

                  ),
                  leading: BackButton(color: Colors.blue),
                ),
                body: Column(
                  children: [
                    Divider(
                      color: Colors.grey,
                      thickness: (0.5).w,
                    ),
                    Expanded(
                      flex: 10,
                      child: ListView.builder(

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                            child: Directionality(
                              textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 200.w),
                                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                    decoration: BoxDecoration(
                                      // color: Colors.green,
                                      color: index.isEven ? Colors.grey : Colors.blue,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.r),
                                        topRight: Radius.circular(20.r),
                                        bottomLeft: Radius.circular(index.isEven ? 20.r : 0.r),
                                        bottomRight: Radius.circular(index.isEven ? 0.r : 20.r), //
                                      ),
                                    ),
                                    child: Text(
                                      'نشكرك على إبلاغنا بالمشكلة التي تواجهها في تحميل الملفات',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: index.isEven ? Colors.white : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      // color: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                      ),
                      width: double.infinity,
                      child: TextFormField(
                        textDirection: TextDirection.rtl,
                        controller: ChatCubit.get(context).createMessageController,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                          fontFamily: 'ElMessiri',
                        ),
                        decoration: InputDecoration(
                          // constraints: BoxConstraints(maxHeight: 50.h, minHeight: 50.h, minWidth: 0.w, maxWidth: 500.w),
                          filled: true,

                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.w,

                          ),
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                            fontFamily: 'ElMessiri',
                          ),
                          prefixIcon: InkWell(
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.send,
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () {
                              ChatCubit.get(context).createMessage();
                            },
                          ),
                          hintText: 'اكتب رسالتك',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                  ],
                )),
          );
        },
      ),
    );
  }
}
