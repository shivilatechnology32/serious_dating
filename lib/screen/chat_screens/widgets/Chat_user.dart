import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serious_dating/screen/chat_screens/chat_space_screen.dart';

import '../../../models/chat_room_model/chat_room_model.dart';
import '../../../models/user_model/user_model.dart';
import '../getx_helper/recent_chat_helper/recent_chat_controller.dart';

class ChatUser extends GetView<RecentChatController> {
  final ChatRoomModel item;
  final UserModel otherUser;

  const ChatUser({Key? key, required this.otherUser, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 2,
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(ChatSpace.routeName, parameters: {
            "chatRoomId": item.chatRoomId,
            "toUserProfile": otherUser.photoId,
            "toUserName": otherUser.username,
            "toUserUid": otherUser.uid,
          });
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.r,
            child: otherUser.photoId != ''
                ? CachedNetworkImage(
                    imageUrl: otherUser.photoId,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44.r),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  )
                : CircleAvatar(
                    radius: 25.r,
                    backgroundImage: const AssetImage(
                      'assets/avatar.png',
                    ),
                  ),
          ),
          title: Text(
            otherUser.username,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          subtitle: Text(
            item.lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
