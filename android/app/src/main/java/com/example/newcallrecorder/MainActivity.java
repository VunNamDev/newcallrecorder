package com.example.newcallrecorder;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import com.example.newcallrecorder.NativeModule.MyModule;
import com.example.newcallrecorder.service.FlutterListion;
import com.example.newcallrecorder.service.MyService;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "samples.flutter.dev/battery";
  private MyModule module ;
  Intent intent;
  public  static FlutterListion flutterListion ;
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    flutterListion = new FlutterListion();
    module = new MyModule(this);
    intent = new Intent(MainActivity.this, MyService.class);

      GeneratedPluginRegistrant.registerWith(this);
//      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//          startForegroundService(intent);
//      }
//      else {
//          startService(intent);
//      }
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
                switch (call.method){
                  case "turnService":
                    module.turnOn(call.argument("title"),call.argument("content"));
                    break;
                }
              }
            });
  }
}
