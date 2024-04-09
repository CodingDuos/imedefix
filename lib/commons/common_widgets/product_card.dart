import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idaawee/utils/thems/my_colors.dart';

class TriangleCard extends StatefulWidget {
  final bool isCondNew;
  final String subCondition;
  final bool isBanner;
  final Color? color;
  const TriangleCard({
    Key? key,
    this.isCondNew = true,
    this.subCondition = 'New',
    required this.isBanner,
    this.color,
  }) : super(key: key);

  @override
  State<TriangleCard> createState() => _TriangleCardState();
}

class _TriangleCardState extends State<TriangleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: 150.h,
            width: 1.sw,
            margin: EdgeInsets.only(right: 0.w, bottom: 0.h),
            padding: EdgeInsets.only(left: 8.w, right: 0.w, top: 0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xffE5E9EB)),
            ),
          ),
          widget.isBanner
              ? Positioned(
                  left: 0,
                  top: 0,
                  child: CustomFigure(
                    color: widget.color,
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0.h, left: widget.subCondition.length > 4 ? 4.h : 10.h),
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(-42.w / 360.h),
              child: Text(
                widget.subCondition.isNotEmpty ? widget.subCondition : "Good",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFigure extends StatelessWidget {
  final Color? color;
  const CustomFigure({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: CustomPaint(
        painter: Figure(color: color),
      ),
    );
  }
}

class Figure extends CustomPainter {
  final Color? color;
  const Figure({this.color});
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint();
    paint.color = color == null ? MyColors.appColor : color!;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = new Path();

    // Drawing triangle
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    //path.moveTo(0, size.height * 0.3);
//     path.lineTo(size.width * 0.5, 40.h);
//     path.lineTo(0, 40.h);
//     path.lineTo(0, size.height * 0.3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
