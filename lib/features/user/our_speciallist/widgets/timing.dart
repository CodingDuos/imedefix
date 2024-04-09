import 'package:google_fonts/google_fonts.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';

class timingpage extends StatefulWidget {
  const timingpage({super.key});

  @override
  State<timingpage> createState() => _timingpageState();
}

class _timingpageState extends State<timingpage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(
                'assets/images/calendar.png',
                color: Color(0xff00A69D),
                height: 15.h,
                width: 15.w,
              ),
              title: Text('Weekly Stats'),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.8, crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 12, top: 8),
                    height: 42,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xff88909859).withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(weekDays[index]),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/sun.png',
                color: Color(0xff00A69D),
                height: 15.h,
              ),
              title: Text(
                'Morning Status',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              children: [0, 1]
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 12),
                        height: 42,
                        width: 110,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff88909859).withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: Text('10:20:00'),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/moon.png',
                color: Color(0xff00A69D),
                height: 15.h,
              ),
              title: Text(
                'Evening Status',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              children: [0, 1]
                  .map((e) => Container(
                        margin: EdgeInsets.only(left: 12),
                        height: 42,
                        width: 110,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xff88909859).withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: Text('10:20:00'),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Consultation Fees',
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0XFF31333B),
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(
                    'Max Duration 30 Minutes',
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff888888),
                            fontWeight: FontWeight.w600)),
                  ),
                  Spacer(),
                  Text(
                    '\$22',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff00A69D)),
                  )
                ],
              ),
            ),
            padding20
          ],
        ));
  }
}

List<String> weekDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursady',
  'Friday',
  'Saturday',
  'Sunday'
];
