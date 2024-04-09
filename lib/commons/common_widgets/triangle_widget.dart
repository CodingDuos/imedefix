import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:idaawee/utils/thems/my_colors.dart';

class CustomTriangleCard extends StatefulWidget {
  final String bannerText;
  final Color? color;
  const CustomTriangleCard({
    Key? key,
    required this.bannerText,
    required this.color,
  }) : super(key: key);

  @override
  State<CustomTriangleCard> createState() => _CustomTriangleCardState();
}

class _CustomTriangleCardState extends State<CustomTriangleCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   height: 150.h,
        //   width: 1.sw,
        //   margin: EdgeInsets.only(right: 0.w, bottom: 0.h),
        //   padding: EdgeInsets.only(left: 8.w, right: 0.w, top: 0.h),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10.r),
        //     border: Border.all(color: const Color(0xffE5E9EB)),
        //   ),
        // ),
        CustomFigure(
          color: widget.color,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 10.0.h, left: widget.bannerText.length > 4 ? 4.h : 10.h),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(-42.w / 360.h),
            child: Text(
              widget.bannerText,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
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
