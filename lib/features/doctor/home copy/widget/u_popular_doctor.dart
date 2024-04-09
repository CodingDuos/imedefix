import 'package:get/get.dart';
import 'package:idaawee/Services/apiServices/api_services.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/home/widget/u_popular_doctor_card.dart';
import 'package:idaawee/providers/user_providers/user_home_screen_provider.dart';
import 'package:idaawee/routes/route_manager.dart';
import 'package:idaawee/universal_models/doctor_models/doctor_SpecificDetailsModel.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class UpopularDoctor extends StatefulWidget {
  const UpopularDoctor({super.key});

  @override
  State<UpopularDoctor> createState() => _UpopularDoctorState();
}

class _UpopularDoctorState extends State<UpopularDoctor> {
  final controller = Get.put(UserHomeScreenProvider());
  var userSpecificDoctorDetailsList = <DoctorSpecificDatailsModel>[];

  ApiServices services = ApiServices();
  bool isloadingData = false;
  triggling() {
    isloadingData = !isloadingData;
    setState(() {});
  }

  Future<List<DoctorSpecificDatailsModel>> DoctorSpecificDoctorDetails() async {
    try {
      triggling();
      List<DoctorSpecificDatailsModel> data =
          await services.fetchSpecificDoctor();
      userSpecificDoctorDetailsList = data;
      triggling();
    } catch (e) {
      print("Error fetching doctor details: $e");
    }
    return [];
  }

  @override
  void initState() {
    DoctorSpecificDoctorDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Doctor',
                  style: getBoldStyle(
                      color: MyColors.textColor, fontSize: MyFonts.size16)),
              Text('See All',
                  style: getBoldStyle(
                      color: MyColors.appColor, fontSize: MyFonts.size16))
            ],
          ),
          padding16,
          isloadingData
              ? Container(
                  height: 300,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userSpecificDoctorDetailsList.length,
                  itemBuilder: (context, index) {
                    DoctorSpecificDatailsModel e =
                        userSpecificDoctorDetailsList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: UPopularDoctorCard(
                        onTap: () async {
                          await controller.userSpecificDoctorDetails(
                              context, e.sId.toString());

                          Navigator.pushNamed(
                              context, AppRoutes.userPlatinumProviderScreen);
                        },
                        image: 'assets/images/img.png',
                        name: e.name.toString(),
                        speciality: e.specialization.toString(),
                        rating: 4.7,
                        review: '(3450 reviews)',
                      ),
                    );
                  })
        ],
      ),
    );
  }
}
