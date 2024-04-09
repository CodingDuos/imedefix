import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/commons/common_widgets/CustomTextFields.dart';
import 'package:idaawee/features/auth/view/doctorregistration/widgets/nextbutton.dart';
import 'package:idaawee/features/auth/widgets/office_all_doctor_screen.dart';
import 'package:idaawee/features/user/our_speciallist/view/user_our_speciallist_screen.dart';
import 'package:idaawee/features/user/our_speciallist/widgets/u_similar_doctor.dart';
import 'package:idaawee/utils/constants/font_manager.dart';

class Office_ConsultaionandTime extends StatefulWidget {
  const Office_ConsultaionandTime({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<Office_ConsultaionandTime> createState() =>
      _Office_ConsultaionandTimeState();
}

class _Office_ConsultaionandTimeState extends State<Office_ConsultaionandTime>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final TextEditingController namecontroller = TextEditingController();
  bool bordercolors1 = false;
  bool bordercolors2 = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHieght = MediaQuery.of(context).size.height;
    return Container(
      width: 1.sw,
      decoration: const BoxDecoration(
        color: MyColors.lightBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: MyColors.lightgrey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      MyColors.appColor1,
                      MyColors.appColor,
                    ]),
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Colors.green,
                  ),
                  labelColor: MyColors.white,
                  unselectedLabelColor: MyColors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: 170.w,
                        child: const Center(child: Text('Add Manually')),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: 170.w,
                        child: const Center(child: Text('Imedifix Doctor')),
                      ),
                    ),
                  ],
                ),
              ),
              padding10,
              _tabController.index == 1
                  ? Column(
                      children: [
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              bordercolors1 = true;
                              bordercolors2 = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UserOurSpecialListScreen()),
                              );
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: bordercolors1 == true
                                      ? Color(0xff1CC19B)
                                      : Color(0xffE7E7E7),
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Search By Specialty ',
                              style: TextStyle(
                                color: bordercolors1 == true
                                    ? Color(0xff1CC19B)
                                    : Color(0xff888888).withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              bordercolors1 = false;
                              bordercolors2 = true;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OfficeAllDoctorScreen()));
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: bordercolors2 == true
                                      ? Color(0xff1CC19B)
                                      : Color(0xffE7E7E7),
                                ),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Search By Name',
                              style: TextStyle(
                                color: bordercolors2 == true
                                    ? Color(0xff1CC19B)
                                    : Color(0xff888888).withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        USimilarDoctor(
                          isaddingdoctor: true,
                          name: 'Dr. Berlin Elizerd',
                          speciality: 'Medicine Specialist',
                          image: 'assets/images/img.png',
                          rating: 4.5,
                          review: '452',
                          onPress: () {},
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.add,
                              color: Color(0xff00A69D),
                              size: 20,
                            ),
                            Text(
                              'Add Another Doctor',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff00A69D)),
                            )
                          ],
                        )
                      ],
                    ),
              SizedBox(
                height: screenHieght * 0.23,
              ),
              padding20,
              NextButton(
                back: () {},
                text: 'Next',
                isbackbuton: true,
                onPressed: widget.onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }

  final List weekdaysname = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
}
