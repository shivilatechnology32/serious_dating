import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:serious_dating/screen/chat_screens/widgets/Chat_user.dart';
import 'package:serious_dating/screen/chat_screens/widgets/available_users.dart';
import 'getx_helper/recent_chat_helper/recent_chat_controller.dart';

class RecentChatScreen extends GetView<RecentChatController> {
  static String routeName = '/recentChatScreen';

  const RecentChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Messages",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: Colors.grey[200],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height-110.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
              ),
              child: Obx(
                () => Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r),
                        ),
                      ),
                      child: Container(
                        width: 100.w,
                        height: 3.h,
                        margin: EdgeInsets.only(top: 15.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 15.w, left: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Chats',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.toNamed(AvailableUsers.routeName);
                            },
                          )
                        ],
                      ),
                    ),
                    controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : controller.state.chatRoomList.isNotEmpty
                            ? Obx(
                                () => ListView.builder(
                                  itemCount: controller.state.chatRoomList.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (controller
                                            .state.chatRoomList.isNotEmpty &&
                                        controller.state.otherUser.isNotEmpty) {
                                      var item =
                                          controller.state.chatRoomList[index];
                                      var otherUser =
                                          controller.state.otherUser[index];
                                      return ChatUser(
                                        item: item,
                                        otherUser: otherUser,
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(top: 80.h),
                                child: Column(
                                  children: [
                                    Lottie.asset(
                                      'assets/no_recent_chat.json',
                                      height: 200.h,
                                      repeat: true,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      'No Recent Chats',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
