import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:onetrust_publishers_native_cmp/onetrust_publishers_native_cmp.dart';


void main() {
  runApp(const MaterialApp(title: "OneTrust Flutter Demo", home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _cmpDownloadStatus = 'Waiting';
  int _c0003Status = -1;
  int _c0004Status = -1;
  OTATTrackingAuthorizationStatus _attStatus =
      OTATTrackingAuthorizationStatus.notDetermined;
  String _dataSubjectId = "Unknown";
  @override
  void initState() {
    super.initState();
    initOneTrust();
    // startListening();
  }

  Future<void> initOneTrust() async {
    bool? status;
    String appId;
    bool? shouldShowBanner;
    String? id;
    OTATTrackingAuthorizationStatus startupATTStatus;

    if (Platform.isAndroid) {
      appId = "811db0c4-38a7-4001-ae69-08bf3274ad29";
    } else if (Platform.isIOS) {
      appId = "811db0c4-38a7-4001-ae69-08bf3274ad29";
    } else {
      Exception("Platform not found!");
      return;
    }
    try {
      status = await OTPublishersNativeSDK.startSDK("cdn.cookielaw.org", appId,'');
      if (await OTPublishersNativeSDK.shouldShowBanner()) {
        OTPublishersNativeSDK.showBannerUI();
      }
      shouldShowBanner = await OTPublishersNativeSDK.shouldShowBanner();
      id = await OTPublishersNativeSDK.getCurrentActiveProfile();
    } on PlatformException {
      print("Error communicating with platform code");
    }

    startupATTStatus =
    await OTPublishersNativeSDK.getATTrackingAuthorizationStatus();

    if (status! && shouldShowBanner!) {
      OTPublishersNativeSDK.showBannerUI();
    }

    if (!mounted) return;

    setState(() {
      _cmpDownloadStatus = status! ? 'Success!' : 'Error';
      _dataSubjectId = id!;
      _attStatus = startupATTStatus;
    });
  }

  void startListening() {
    var consentListener =
    OTPublishersNativeSDK.listenForConsentChanges(["C0003", "C0004"])
        .listen((event) {
      setCategoryState(event['categoryId'], event['consentStatus']);
      print("New status for " +
          event['categoryId'] +
          " is " +
          event['consentStatus'].toString());
    });

    var interactionListener =
    OTPublishersNativeSDK.listenForUIInteractions().listen((event) {
      print(event);
    });

    //consentListener.cancel(); //Cancel event stream before opening a new one
  }

  void setCategoryState(String category, int status) {
    setState(() {
      switch (category) {
        case "C0003":
          _c0003Status = status;
          break;
        case "C0004":
          _c0004Status = status;
          break;
        default:
          break;
      }
    });
  }

  void loadATTPrompt() async {
    int? status;
    status = await OTPublishersNativeSDK.showConsentUI(OTDevicePermission.idfa);
    if (status != null) {
      setState(() {
        _attStatus = OTATTrackingAuthorizationStatus.values[status!];
      });
    }
  }

  void loadAgeGatePrompt() async {
    int? status =
    await OTPublishersNativeSDK.showConsentUI(OTDevicePermission.ageGate);
    print("Age Gate Status is $status");
  }

  Column getATTColumn() {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              loadATTPrompt();
            },
            child: Text("Load ATT Prompt")),
        Text("ATT Status = $_attStatus\n")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('OneTrust Download Status: $_cmpDownloadStatus\n'),
            ElevatedButton(
                onPressed: () {
                  OTPublishersNativeSDK.showBannerUI();
                },
                child: Text("Load Banner")),
            ElevatedButton(
                onPressed: () {
                  OTPublishersNativeSDK.showPreferenceCenterUI();
                },
                child: Text("Load Preference Center")),
            ElevatedButton(
                onPressed: () {
                  loadAgeGatePrompt();
                },
                child: Text("Load Age Gate")),
            Platform.isIOS //conditionally render ATT Pre-prompt button
                ? getATTColumn()
                : Container(),
            Text('Category C0003 Status: $_c0003Status\n'),
            Text('Category C0004 Status: $_c0004Status\n'),
            Text('Data Subject Identifier is'),
            Text(_dataSubjectId, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}