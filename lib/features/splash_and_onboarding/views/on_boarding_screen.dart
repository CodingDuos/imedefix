import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_text/common.text.dart';
import 'package:idaawee/commons/common_widgets/custom_button.dart';
import 'package:idaawee/features/splash_and_onboarding/controller/onboarding_controller.dart';
import 'package:idaawee/features/splash_and_onboarding/widgets/on_boarding_page_section.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class OnbordingScreen extends ConsumerWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller:
                ref.watch(onboardingControllerProvider.notifier).pageController,
            children: const [
              OnboardingPageSection(
                title: onBoardingScreens1,
                image: AppAssets.splash_31,
                subtitle: subonBoardingScreens1,
              ),
              OnboardingPageSection(
                title: onBoardingScreens2,
                image: AppAssets.splash_1,
                subtitle: subonBoardingScreens1,
              ),
              OnboardingPageSection(
                title: onBoardingScreens3,
                image: AppAssets.splash_31,
                subtitle: subonBoardingScreens1,
              ),
              // Add more screens here
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 37, bottom: 32),
            child: CustomButton(
              onPressed: () {
                ref.read(onboardingControllerProvider.notifier).state == 2
                    ? Navigator.pushReplacementNamed(
                        context, AppRoutes.accountType)
                    : ref
                        .read(onboardingControllerProvider.notifier)
                        .nextPage();
              },
              buttonText: 'Next',
              textStyle:
                  getBoldStyle(color: MyColors.white, fontSize: MyFonts.size18),
            ),
          )),
    );
  }
}
