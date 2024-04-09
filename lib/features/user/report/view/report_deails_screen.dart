// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:file_picker/file_picker.dart';
import 'package:idaawee/commons/common_functions/padding.dart';
import 'package:idaawee/commons/common_imports/common_libs.dart';
import 'package:idaawee/features/user/report/widget/u_report_status_widget.dart';
import 'package:idaawee/features/user/report/widget/u_status_card.dart';
import '../../../../utils/constants/assets_manager.dart';

class ReportDetailsScreen extends StatefulWidget {
  final String title;
  const ReportDetailsScreen({super.key, required this.title});

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  final List<String> items = [
    'BMP',
    'CMP',
    'ESR',
  ];

  String? _filePath;

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'doc',
          'docx'
        ], // Add the extensions you want to allow
      );

      if (result != null) {
        setState(() {
          _filePath = result.files.first.path;
        });
      } else {
        // User canceled the picker
      }
    } catch (e) {
      print("Error picking document: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff38B698).withOpacity(0.1),
          automaticallyImplyLeading: true,
          title: Text(
            'Blood Report',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: _pickDocument,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            )
          ]),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.homeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              if (_filePath != null)
                Text(
                  'Selected File: $_filePath',
                  style: TextStyle(fontSize: 16),
                ),
              const UReportStatusWidget(),
              padding10,
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: UStatusCard(
                        title: items[index],
                        date: '02 Sep 2023',
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
