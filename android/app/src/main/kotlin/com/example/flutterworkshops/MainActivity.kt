package com.example.flutterworkshops

import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    private lateinit var compass: CompassService
    private val CHANNEL = "com.example.flutterworkshops/compass"

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        compass = CompassService(this.context) { data: Double -> gotCompassData(flutterEngine, data)}

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "startCompass") {
                this.compass.start()
            } else if (call.method == "stopCompass"){
                this.compass.stop()
            }
        }

    }

    private fun gotCompassData(flutterEngine: FlutterEngine, azimuth: Double) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("gotCompassData", azimuth)
    }
}

