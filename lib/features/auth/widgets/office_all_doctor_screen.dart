import 'package:flutter/material.dart';
import 'package:idaawee/utils/constants/assets_manager.dart';

class OfficeAllDoctorScreen extends StatefulWidget {
  const OfficeAllDoctorScreen({super.key});

  @override
  State<OfficeAllDoctorScreen> createState() => _OfficeAllDoctorScreenState();
}

class _OfficeAllDoctorScreenState extends State<OfficeAllDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff38B698).withOpacity(0.1),
          title: Text(
            'Our Doctor',
            style: TextStyle(
              color: Color(0XFF31333B),
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.homeBg), fit: BoxFit.cover),
          ),
          child: Column(
            children: [],
          ),
        ));
  }
}
