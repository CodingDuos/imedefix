import 'package:flutter/material.dart';
import 'package:idaawee/features/account_type%20copy/view/d_account_type_screen.dart';
import 'package:idaawee/features/account_type/view/account_type_screen.dart';
import 'package:idaawee/features/auth/view/completeprofile.dart/completeprofile.dart';
import 'package:idaawee/features/auth/view/doctor_login_screen.dart';
import 'package:idaawee/features/auth/view/doctor_registration.dart';
import 'package:idaawee/features/auth/view/user_login_screen.dart';
import 'package:idaawee/features/auth/view/user_signup_screen.dart';
import 'package:idaawee/features/auth/view/staff_portal_sigin.dart';
import 'package:idaawee/features/doctor/appointment_offer/view/doctor_appointment_offer_screen.dart';
import 'package:idaawee/features/doctor/become_a_doctor/view/become_a_doctor_screen.dart';
import 'package:idaawee/features/doctor/become_a_doctor/view/pending_approvel_screen.dart';
import 'package:idaawee/features/doctor/consulation_offer/view/doctor_consulation_offer_screen.dart';
import 'package:idaawee/features/doctor/doctor_check_out_order_history/view/doctor_check_out_appointment_screen.dart';
import 'package:idaawee/features/doctor/doctor_check_out_order_history/view/doctor_check_out_consulation_screen.dart';
import 'package:idaawee/features/doctor/doctor_check_out_order_history/view/doctor_check_out_labtest_screen.dart';
import 'package:idaawee/features/doctor/doctor_check_out_order_history/view/doctor_check_out_order_history_screen.dart';
import 'package:idaawee/features/doctor/doctor_check_out_order_history/view/doctor_check_out_pharmacy_screen.dart';
import 'package:idaawee/features/doctor/doctor_main_menu/views/doctor_menu_screen.dart';

import 'package:idaawee/features/doctor/doctorwallet/view/amount.dart';
import 'package:idaawee/features/doctor/doctorwallet/view/doctorwallet.dart';
import 'package:idaawee/features/doctor/doctorwallet/view/payment_successfull.dart';
import 'package:idaawee/features/doctor/doctorwallet/view/summary.dart';
import 'package:idaawee/features/doctor/join_office/view.dart';
import 'package:idaawee/features/doctor/labtest_offer/view/doctor_labtest_offer_screen.dart';
import 'package:idaawee/features/doctor/main_menu/views/doctor_main_menu_screen.dart';
import 'package:idaawee/features/doctor/notification/view/doctor_notification_screen.dart';
import 'package:idaawee/features/doctor/paymentmethod/view/add_payment_method.dart';
import 'package:idaawee/features/doctor/pharmacy_offer/view/doctor_pharmacy_offer_screen.dart';
import 'package:idaawee/features/doctor/settings/settingspage.dart';
import 'package:idaawee/features/splash_and_onboarding/views/on_boarding_screen.dart';
import 'package:idaawee/features/splash_and_onboarding/views/splash_screen.dart';
import 'package:idaawee/features/user/bookdoctor/view/payment_method.dart';
import 'package:idaawee/features/user/home/view/user_next_appointment_screen.dart';
import 'package:idaawee/features/user/our_speciallist/view/user_our_specialist_detail_screen.dart';
import 'package:idaawee/features/user/our_speciallist/view/user_our_speciallist_screen.dart';
import 'package:idaawee/features/user/our_speciallist/view/user_platinum_provider_screen.dart';
import 'package:idaawee/features/user/report/view/add_report_screen.dart';
import 'package:idaawee/features/user/user_notification/view/user_notification_screen.dart';
import 'package:idaawee/features/user/home/view/user_home_screen.dart';
import 'package:idaawee/features/user/record_screen/view/record_screen.dart';
import 'package:idaawee/features/user/report/view/report_deails_screen.dart';
import 'package:idaawee/features/user/record_screen/view/appointment_detail_screen.dart';
import 'package:idaawee/features/user/user_main_menu/views/main_menu_screen.dart';
import 'package:idaawee/features/user/report/view/user_report_screen.dart';
import 'package:idaawee/features/doctor/doctor_profile/view/doctor_edit_profile_screen.dart';
import 'package:idaawee/utils/error_screen.dart';
import 'navigation.dart';

class AppRoutes {
  //Common Portion
  static const String signUpScreen = '/signUpScreen';
  static const String splashScreen = '/splashScreen';
  static const String onBoardingScreens = '/onBoardingScreens';
  static const String staffPortalSignInScreen = '/staffPortalSignInScreen';
  static const String accountType = '/accountType';
  static const String loginScreen = '/loginScreen';
  // User Portion
  static const String userSpecialListScreen = '/userSpecialListScreen';
  static const String userSpecialListDetailScreen =
      '/userSpecialListScreenDetail';
  static const String userPlatinumProviderScreen =
      '/userPlatinumProviderScreen';
  static const String userHomeScreen = '/userHomeScreen';
  static const String userMainMenuScreen = '/userMainMenuScreen';
  static const String addRecordScreen = '/addRecordScreen';
  static const String recordScreen = '/recordScreen';
  static const String userReportScreen = '/userReportScreen';
  static const String appointmentDetailsScreen = '/appointmentDetailsScreen';
  static const String reportDetailScreen = '/reportDetailScreen';
  static const String userNextAppintmentScreen = '/userNextAppintmentScreen';
  static const String consulationPaymentScreen = 'consulationPaymentScreen';
  static const String offerSuccessfullScreen = '/offerSuccessfullScreen';
  static const String addReportScreen = '/addReportScreen';
  static const String notificationScreen = '/notificationScreen';

  // Doctor portion

  /// Doctor Section
  static const String doctorMainMenu = '/doctorMainMenu';
  static const String doctorConsulationOfferScreen = '/doctorConsulationOffer';
  static const String doctorLabTestOfferScreen = '/doctorLabTestOfferScreen';
  static const String doctorPharmacyOfferScreen = '/doctorPharmacyOfferScreen';
  static const String doctorAppointmentOfferScreen =
      '/doctorAppointmentOfferScreen';
  static const String doctorNotificationScreen = '/doctorNotificationScreen';
  static const String doctorCheckOutOrderHistory =
      '/doctorCheckOutOrderHistory';
  static const String doctorEditProfileScreen = '/doctorEditProfileScreen';
  static const String doctorCheckOutConsulation = '/doctorCheckOutConsulation';
  static const String doctorCheckOutAppointment = '/doctorCheckOutAppointment';
  static const String doctorCheckOutLabTest = '/doctorCheckOutLabTest';
  static const String doctorCheckOutPharmacy = '/doctorCheckOutPharmacy';
  static const String becomeaDoctorScreen = '/becomeaDoctorScreen';
  static const String pendingApprovelScreen = '/pendingApprovelScreen';

  //Common Portion
  static const String settingsPageScreen = '/SettingsPageScreen';
  static const String addPaymentMethod = '/AddPaymentMethod';
  static const String joinOfficePage = '/JoinOfficePage';
  static const String paymntSuccessfull = '/PaymntSuccessfull';
  static const String walletSummaryPage = '/WalletSummaryPage';
  static const String addPaymentScreen = '/AddPaymentScreen';
  static const String doctorwalletAmountScreen = '/doctorwalletAmountScreen';
  static const String doctorwalletScreen = '/doctorWalletScreen';
  static const String udoctormainMainMenuScreen = '/doctorMainMenuScreen';
  static const String completeDoctorProfile = '/CompleteDoctorProfile';

  static const String doctoraccountType = '/doctoraccountType';

  static const String doctorloginScreen = '/doctorloginScreen';
  static const String officedoctorloginScreen = '/officedoctorloginScreen';
  static const String doctorRegistration = '/doctorregistration';
  static const String officedoctorRegistration = '/officedoctorregistration';

  // User Portion

  static const String doctorListScreen = '/doctorListScreen';
  static const String userAppointment = '/userAppointment';
  static const String userSpeciallizedQuickAppointment =
      '/userSpeciallizedQuickAppointment';
  static const String userSpeciallizedDoctorsScreen =
      '/userSpeciallizedDoctorsScreen';
  static const String userConsultationScreem = '/userConsultationScreem';
  static const String userSpeciallizedConsultationScreen =
      '/userSpeciallizedConsultationScreen';
  static const String userQuickConsultationScreen =
      '/userQuickConsultationScreem';
  static const String medicalRecordScreen = '/medicalRecordScreen';

  static const String paymentScreen = '/paymentScreen';
  static const String labScreen = '/labScreen';
  static const String pharmacyScreen = '/pharmacyScreen';
  static const String searchPharmacy = '/searchPharmacy';
  static const String explorePharmacyProduct = '/explorePharmacyProduct';
  static const String uploadPresentation = '/uploadPresentation';
  static const String xlabDetail = '/xlabDetail';
  static const String orderlabScreen = '/orderlabScreen';
  static const String userLabPaymentModeScreen = '/userLabPaymentModeScreen';
  static const String labPaymentScreen = '/labPaymentScreen';
  static const String userConfirmedAppointmentScreen =
      '/userConfirmedPointmentScreen';
  static const String bookDoctorPage = '/BookDoctorPage';
  static const String userEditProfileScreen = '/userEditProfileScreen';
  static const String helpsupportScreen = '/helpsupportScreen';
  static const String about = '/about';
  static const String contactUs = '/contactUs';
  static const String privactPolicy = '/privactPolicy';
  static const String faq = '/faq';
  static const String checkOutOrderHistory = '/checkOutOrderHistory';
  static const String checkOutConsulation = '/checkOutConsulation';
  static const String checkOutAppointment = '/checkOutAppointment';
  static const String checkOutLabTest = '/checkOutLabTest';
  static const String checkOutPharmacy = '/checkOutPharmacy';

  static const String labSearchScreen = '/labSearchScreen';
  static const String pharmacySearchScreen = '/pharmacySearchScreen';
  static const String userTermAndConditionScreen =
      '/userTermAndConditionScreen';

  // Doctor portion

  /// Doctor Section

  /// Doctor Section

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case bookDoctorPage:
        return _buildRoute(BookDoctorPage());
      case completeDoctorProfile:
        return _buildRoute(CompleteDoctorProfile());
      case notificationScreen:
        return _buildRoute(UserNotificationScreen());
      case settingsPageScreen:
        return _buildRoute(const SettingsPageScreen());
      case addPaymentMethod:
        return _buildRoute(const AddPaymentScreen());
      case joinOfficePage:
        return _buildRoute(const JoinOfficePage());
      case paymntSuccessfull:
        return _buildRoute(PaymntSuccessfull());
      case walletSummaryPage:
        return _buildRoute(WalletSummaryPage());
      case addPaymentScreen:
        return _buildRoute(const AddPaymentScreen());
      case doctorwalletAmountScreen:
        return _buildRoute(const DoctorwalletAmountScreen());
      case doctorwalletScreen:
        return _buildRoute(const DoctorwalletScreen());
      case udoctormainMainMenuScreen:
        return _buildRoute(const DoctorMainMenuScreenMain());
      case doctorRegistration:
        return _buildRoute(DoctorRegistration(isofficedoctor: false));
      case officedoctorRegistration:
        return _buildRoute(DoctorRegistration(isofficedoctor: true));
      case doctoraccountType:
        return _buildRoute(const DoctorAccountType());
      case signUpScreen:
        return _buildRoute(const UserSignUpScreen());
      case userSpecialListScreen:
        return _buildRoute(const UserOurSpecialListScreen());
      case doctorloginScreen:
        return _buildRoute(DoctorLoginScreen(isofficedocor: false));
      case officedoctorloginScreen:
        return _buildRoute(DoctorLoginScreen(isofficedocor: true));
      case loginScreen:
        return _buildRoute(const UserLoginScreen());
      case splashScreen:
        return _buildRoute(const SplashScreen());
      case onBoardingScreens:
        return _buildRoute(const OnbordingScreen());
      case staffPortalSignInScreen:
        return _buildRoute(const StaffPortalSignInScreen());
      case accountType:
        return _buildRoute(const AccountTypeScreen());
      case userHomeScreen:
        return _buildRoute(UserHomeScreen());
      case userMainMenuScreen:
        return _buildRoute(const UserMainMenuScreen());

      /// DOCTOR SECTION ///
      case doctorMainMenu:
        return _buildRoute(const DoctorMainMenuScreen());
      case doctorConsulationOfferScreen:
        return _buildRoute(DoctorConsulationOfferScreen());
      case doctorAppointmentOfferScreen:
        return _buildRoute(DoctorAppointmentOfferScreen());
      case doctorLabTestOfferScreen:
        return _buildRoute(DoctorLabTestOfferScreen());
      case doctorPharmacyOfferScreen:
        return _buildRoute(DoctorPharmacyOfferScreen());
      case doctorNotificationScreen:
        return _buildRoute(const DoctorNotificationScreen());
      case doctorCheckOutOrderHistory:
        return _buildRoute(const DoctorCheckOutOrderHistory());
      case doctorEditProfileScreen:
        return _buildRoute(DoctorEditProfileScreen(
          onPressed: () {},
        ));

      case doctorCheckOutConsulation:
        return _buildRoute(const DoctorCheckOutConsulation());
      case doctorCheckOutAppointment:
        return _buildRoute(const DoctorCheckOutAppointmentScreen());
      case doctorCheckOutLabTest:
        return _buildRoute(const DoctorCheckOutLabTest());
      case doctorCheckOutPharmacy:
        return _buildRoute(const DoctorCheckOutPharmacy());
      case becomeaDoctorScreen:
        return _buildRoute(const BecomeADoctorScreen());
      case pendingApprovelScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return _buildRoute(
            PendingApprovelScreen(approvel: arguments["approvel"]));

      /// DOCTOR SECTION ///

      case userSpecialListDetailScreen:
        return _buildRoute(UserOurSpecialistDetailScreen());

      // case userNextAppintmentScreen:
      //   return _buildRoute(const UserNextAppointmenyScreen());

      case userPlatinumProviderScreen:
        return _buildRoute(UserPlatinumProviderScreen());

      case addReportScreen:
        return _buildRoute(const AddReportScreen());

      case recordScreen:
        return _buildRoute(RecordScreen());
      case userReportScreen:
        return _buildRoute(const UserReportScreen());

      case appointmentDetailsScreen:
        return _buildRoute(AppointmentDetailScreen());

      case reportDetailScreen:
        final arguments = settings.arguments as Map<String, dynamic>;

        return _buildRoute(ReportDetailsScreen(
          title: arguments["title"],
        ));

      /// DOCTOR SECTION ///

      default:
        return unDefinedRoute();
    }
  }

  static unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              backgroundColor: Colors.white,
            ));
    // ignore: dead_code
    return MaterialPageRoute(builder: (_) => const ErrorScreen());
  }

  static _buildRoute(Widget widget, {int? duration = 400}) {
    return forwardRoute(widget, duration);
  }

  static _buildNormalRoute(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
