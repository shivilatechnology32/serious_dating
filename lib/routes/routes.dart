import 'package:get/get.dart';
import 'package:serious_dating/screen/DashBoard/bottom_navigation.dart';
import 'package:serious_dating/screen/gender.dart';
import 'package:serious_dating/screen/reset_password.dart';
import 'package:serious_dating/screen/sign_in.dart';

import '../screen/DashBoard/user_match_screen.dart';
import '../screen/chat_screens/chat_space_screen.dart';
import '../screen/chat_screens/getx_helper/chat_space_helper/chat_space_bindings.dart';
import '../screen/chat_screens/recent_chat_screen.dart';
import '../screen/chat_screens/widgets/available_users.dart';
import '../screen/interest.dart';
import '../screen/login.dart';
import '../screen/reset_verify_otp.dart';
import '../screen/splash.dart';

class RouteClass {

  static List<GetPage> routes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Login.routeName,
      page: () => const Login(),
    ),
    GetPage(
      name: SelectGender.routeName,
      page: () => const SelectGender(),
    ),
    GetPage(
      name: SignIn.routeName,
      page: () => const SignIn(),
    ),
    GetPage(
      name: Interest.routeName,
      page: () => const Interest(),
    ),
    GetPage(
      name: BottomNavigator.routeName,
      page: () => const BottomNavigator(),
    ),
    GetPage(
      name: ResetPassword.routeName,
      page: () => const ResetPassword(),
    ),
    GetPage(
      name: UserMatchScreen.routeName,
      page: () => const UserMatchScreen(),
    ),
    GetPage(
      name: VerifyOTP.routeName,
      page: () => const VerifyOTP(),
    ),
    GetPage(
      name: RecentChatScreen.routeName,
      page: () => const RecentChatScreen(),
    ),
    GetPage(
      name: ChatSpace.routeName,
      page: () => const ChatSpace(),
      binding: ChatSpaceBinding(),
    ),
    GetPage(
      name: AvailableUsers.routeName,
      page: () => const AvailableUsers(),
    ),
  ];
}
