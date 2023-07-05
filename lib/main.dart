import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:serious_dating/routes/routes.dart';
import 'package:serious_dating/screen/chat_screens/getx_helper/recent_chat_helper/recent_chat_controller.dart';

import 'package:serious_dating/screen/splash.dart';
import 'package:serious_dating/services/firebase.dart';
import 'package:serious_dating/services/storage.dart';
import 'package:serious_dating/services/user.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(FirebaseFireStore());
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<UserStore>(UserStore());
  Get.put(RecentChatController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Serious Dating',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          initialRoute:  SplashScreen.routeName,
          getPages: RouteClass.routes,
        );
      }
    );
  }
}


