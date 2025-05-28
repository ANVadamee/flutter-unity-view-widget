import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

void main() {
  runApp(const MaterialApp(home: UnityDemoScreen()));
}

class UnityDemoScreen extends StatefulWidget {
  const UnityDemoScreen({Key? key}) : super(key: key);

  @override
  State<UnityDemoScreen> createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<UnityDemoScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController? _unityWidgetController;

  bool _showUnity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            _showUnity
                ? _buildUnityView() // 显示Unity界面
                : _buildLaunchButton(), // 显示启动按钮
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     key: _scaffoldKey,
  //     body: SafeArea(
  //       bottom: false,
  //       child: WillPopScope(
  //         onWillPop: () async {
  //           // Pop the category page if Android back button is pressed.
  //           return true;
  //         },
  //         child: Container(
  //           color: Colors.yellow,
  //           child: UnityWidget(onUnityCreated: onUnityCreated), // 显示启动按钮
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;

    controller.postMessage(
      'ParameterReceiver', // Unity 中的 GameObject 名称
      'ReceiveNumber', // Unity 脚本中的方法名
      '100', // 发送的数字（需转为字符串）
    );
  }

  Widget _buildLaunchButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () => setState(() => _showUnity = true),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          backgroundColor: Colors.blue[600], // 按钮颜色
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          '进入3D场景',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildUnityView() {
    return Stack(
      children: [
        UnityWidget(
          onUnityCreated: onUnityCreated,
          fullscreen: true, // 全屏显示Unity
          borderRadius: BorderRadius.circular(0),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => setState(() => _showUnity = false),
          ),
        ),
      ],
    );
  }
}
