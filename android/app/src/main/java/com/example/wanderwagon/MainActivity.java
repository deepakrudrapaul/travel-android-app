package com.example.wanderwagon;

import android.os.Build;
import android.os.Bundle;

import java.util.concurrent.TimeUnit;

import androidx.work.PeriodicWorkRequest;
import androidx.work.WorkManager;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      getWindow().setStatusBarColor(0xFF5D1049);
    }

      PeriodicWorkRequest locationWork = new PeriodicWorkRequest.Builder(
              BackgroundWorker.class, 15, TimeUnit.SECONDS
      ).addTag("BackgroundWorker").build();

      MethodChannel methodChannel =
              new MethodChannel(getFlutterView(), "workerManager");
    methodChannel.setMethodCallHandler((methodCall, result) -> {
        if(methodCall.method.equals("startWork")) {
            WorkManager.getInstance().enqueue(locationWork);
            result.success(5);
        }
    });

    GeneratedPluginRegistrant.registerWith(this);
  }
}
