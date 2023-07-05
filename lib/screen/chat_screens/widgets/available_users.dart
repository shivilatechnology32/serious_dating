import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../getx_helper/recent_chat_helper/recent_chat_controller.dart';
import 'available_user_tile.dart';

class AvailableUsers extends GetView<RecentChatController> {
  static String routeName = '/availableUsers';
  const AvailableUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Start new chat",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SmartRefresher(
        controller: controller.refreshController2,
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: controller.onRefreshLoadUser,
        header: const WaterDropMaterialHeader(),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 10, right: 10, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0),
                ),
                child: ListTile(
                  leading: const Icon(Icons.search),
                  tileColor: Colors.white,
                  title: TextField(
                    // TODO: search Controller
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: GoogleFonts.poppins()
                    ),
                  )
                ),
              ),
              Text(
                "Releated User",
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              Obx(
                () => !controller.isLoading.value
                    ? Expanded(
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: ListView.builder(
                            itemCount: controller.users.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return AvailableUserTile(index: index);
                            },
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
