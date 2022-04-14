import 'package:get/get.dart';
import 'package:newsanbercode/pages/account/account_setting.dart';
import 'package:newsanbercode/pages/account/my_account.dart';
import 'package:newsanbercode/pages/account/my_profile.dart';
import 'package:newsanbercode/pages/account/my_skill.dart';
import 'package:newsanbercode/pages/dashboard/dashboard.dart';
import 'package:newsanbercode/pages/dashboard/detail_page.dart';
import 'package:newsanbercode/pages/login_page/login_page_email.dart';
import 'package:newsanbercode/pages/login_page/login_page_password.dart';
import 'package:newsanbercode/pages/registration_page/add_skill_page.dart';
import 'package:newsanbercode/pages/registration_page/email_verification.dart';
import 'package:newsanbercode/pages/registration_page/register_profile.dart';
import 'package:newsanbercode/pages/registration_page/register_skill.dart';
import 'package:newsanbercode/pages/registration_page/registration_email.dart';
import 'package:newsanbercode/routing/routes_named.dart';

class AppRoutes {
  static final pages = [
    // GetPage(
    //   name: RoutesName.splash_screen,
    //   page: () => SplashScreen(),
    // ),
    GetPage(
      name: RoutesName.dashboard,
      page: () => Dashboard(),
    ),
    GetPage(
      name: RoutesName.job_detail_page,
      page: () => JobDetailPage(),
    ),
    GetPage(
      name: RoutesName.login_page_email,
      page: () => LoginPageEmail(),
    ),
    GetPage(
      name: RoutesName.login_page_password,
      page: () => LoginPagePassword(),
    ),
    // GetPage(
    //   name: RoutesName.login_account_recovery,
    //   page: () => AccountRecovery(),
    // ),
    // GetPage(
    //   name: RoutesName.login_reset_password,
    //   page: () => ResetPassword(),
    // ),
    GetPage(
      name: RoutesName.registration_page,
      page: () => RegistrationEmail(),
    ),
    GetPage(
      name: RoutesName.email_verification_page,
      page: () => EmailVerificationPage(),
    ),
    GetPage(
      name: RoutesName.register_profile_page,
      page: () => RegisterProfile(),
    ),
    GetPage(
      name: RoutesName.register_skill_page,
      page: () => RegisterSkill(),
    ),
    GetPage(
      name: RoutesName.add_skill_page,
      page: () => AddSkillPage(),
    ),
    GetPage(
      name: RoutesName.account_my_account,
      page: () => MyAccountPage(),
    ),
    GetPage(
      name: RoutesName.account_profile,
      page: () => MyProfilePage(),
    ),
    GetPage(
      name: RoutesName.account_skill,
      page: () => MySkillPage(),
    ),
    GetPage(
      name: RoutesName.account_setting,
      page: () => AccountSettingPage(),
    ),
  ];
}
