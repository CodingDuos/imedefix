// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_book_appointment_widget.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

import '../../../../commons/common_widgets/CustomTextFields.dart';

class UserOurSpecialistDetailScreen extends StatelessWidget {
  UserOurSpecialistDetailScreen({super.key});

  final controller = Get.put(UserHomeScreenProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff38B698).withOpacity(0.1),
        title: Text(
          'Our Specialization',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      // appBar: CommonAppBar(
      //   onPressed: () {
      //     Navigator.of(context).pop();
      //   },
      //   appBarTitle: 'Our Specialization',
      // ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.homeBg), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: CustomTextField(
                  validatorFn: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  leadingIconPath: AppAssets.search,
                  trailingIconPath: AppAssets.filter,
                  texfieldHeight: 60.h,
                  controller: TextEditingController(),
                  hintText: 'Search Doctor / Condition',
                  onChanged: (value) {},
                  onFieldSubmitted: (value) {},
                  obscure: false,
                  label: '',
                  subTitle: '',
                ),
              ),
              controller.userDetailsList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        child: Center(
                          child: Text('no founD Doctor'),
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.userDetailsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var userDetail = controller.userDetailsList[index];
                        var firstDaily = userDetail.once!.isNotEmpty
                            ? userDetail.once!.first
                            : null;

                        return UBookAppointmentWidget(
                          Timeto: firstDaily?.timetill ?? '',
                          name: userDetail.name,
                          speciality: userDetail.specialization,
                          experince: userDetail.yearofexperience
                              .toString(), // Ensure this is a string, adjust as necessary
                          free: firstDaily?.consultationfees ?? '',
                          waitTime: firstDaily?.timefrom ?? '',
                          avilbelTime: firstDaily?.timefrom ?? '',
                          qualification: userDetail.education,

                          onTap: () async {
                            final doctorId = controller
                                .userDetailsList[index].sId
                                .toString();
                            await controller.userSpecificDoctorDetails(
                                context, doctorId);

                            Navigator.pushNamed(
                                context, AppRoutes.userPlatinumProviderScreen);
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
