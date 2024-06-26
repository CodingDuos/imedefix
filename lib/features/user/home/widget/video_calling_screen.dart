// ignore_for_file: prefer_const_constructors, library_prefixes

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:idaawee/credientals/contants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:idaawee/features/user/home/widget/consultation.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class VideoCallingScreen extends StatefulWidget {
  const VideoCallingScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallingScreen> createState() => _VideoCallingScreenState();
}

const videocallingToken =
    '007eJxTYFDi03WO2/Jict/Lxhkr9+XtLAj68UCD13PmrOilMzo/bOhTYEhLNTVINrdINTe2TDRJNTdINDRItjQzS0q0TExMNDK25Lz7LLUhkJGBbZoiEyMDBIL4rAwlqcUlhgwMAMPMIKY=';
const appIds = '3098667d403c4576ae313beaa5c33593';

class _VideoCallingScreenState extends State<VideoCallingScreen> {
  final AgoraClient _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
    appId: appIds,
    channelName: 'test1',
    tempToken: videocallingToken,
  ));
  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
    _endCall(); // Call _endCall after initializing Agora
  }

  void _endCall() async {
    await _client.engine.leaveChannel();
    _navigateToConsultationScreen();
  }

  void _navigateToConsultationScreen() {
    // Use Navigator to push to your consultation screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Consultation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Video Call'),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: _client,
                enabledButtons: [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.switchCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Ensure you have your ConsultationScreen widget defined
class ZegoCallingScreen extends StatelessWidget {
  const ZegoCallingScreen(
      {Key? key,
      required this.callID,
      required this.userId,
      required this.patientname})
      : super(key: key);
  final String callID;
  final String userId;
  final String patientname;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: Credientals.appId,
        appSign: Credientals.appSign,
        userID: userId,
        userName: patientname,
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..topMenuBar.isVisible = true
          ..topMenuBar.buttons = [
            ZegoCallMenuBarButtonName.minimizingButton,
            ZegoCallMenuBarButtonName.showMemberListButton,
            ZegoCallMenuBarButtonName.soundEffectButton,
          ]);
  }
}

class ZIMKitDemoHomePage extends StatelessWidget {
  const ZIMKitDemoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(),
        body: ZIMKitConversationListView(
          onPressed: (context, conversation, defaultAction) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ZIMKitMessageListPage(
                  conversationID: conversation.id,
                  conversationType: conversation.type,
                );
              },
            ));
          },
        ),
      ),
    );
  }
}
