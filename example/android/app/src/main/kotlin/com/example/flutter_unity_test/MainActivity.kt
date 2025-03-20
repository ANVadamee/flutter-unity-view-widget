package com.example.flutter_unity_test
import io.flutter.embedding.android.FlutterActivity
import com.xraph.plugin.flutter_unity_widget.IFlutterUnityActivity;

class MainActivity: FlutterActivity(), IFlutterUnityActivity {
    @JvmField 
    var mUnityPlayer: java.lang.Object? = null;

    override fun setUnityPlayer(unityPlayer: java.lang.Object?) {
        mUnityPlayer = unityPlayer;
    }
}