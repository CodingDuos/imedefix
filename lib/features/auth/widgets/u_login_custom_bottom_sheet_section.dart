import 'package:idaawee/commons/common_imports/apis_commons.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/auth/controller/bottom_page_controller.dart';
import 'package:idaawee/features/auth/widgets/u_bottom_page_three.dart';
import 'package:idaawee/features/auth/widgets/u_bottom_page_two.dart';
import 'package:idaawee/features/auth/widgets/u_bottom_page_one.dart';

class ULoginCustomBottomSection extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController pinOneController;
  final TextEditingController pinTwoController;
  final TextEditingController pinThreeController;
  final TextEditingController pinFourController;
  final TextEditingController newPasswordController;
  final TextEditingController reEnterPasswordController;
  final ScrollController scrollController;

  const ULoginCustomBottomSection(
      {super.key,
      required this.emailController,
      required this.pinOneController,
      required this.pinTwoController,
      required this.pinThreeController,
      required this.pinFourController,
      required this.newPasswordController,
      required this.reEnterPasswordController,
      required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(ref.watch(bottomPageController.notifier).state);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: ref.watch(bottomPageController.notifier).pageController,
        children: [
          UBottomPageOne(
            scrollControlle: scrollController,
            onTap: () {
              ref.watch(bottomPageController.notifier).nextPage();
            },
            emailController: emailController,
          ),
          UBottomPageTwo(
            scrollControlle: scrollController,
            onTap: () {
              ref.read(bottomPageController.notifier).nextPage();
            },
            pin1Controller: pinOneController,
            pin2Controller: pinTwoController,
            pin3Controller: pinThreeController,
            pin4Controller: pinFourController,
          ),
          UBottomPageThree(
            scrollControlle: scrollController,
            rePassController: reEnterPasswordController,
            onTap: () {
              Navigator.pop(context);
            },
            newPassController: newPasswordController,
          ),
          // Add more screens here
        ],
      ),
    );
  }
}
