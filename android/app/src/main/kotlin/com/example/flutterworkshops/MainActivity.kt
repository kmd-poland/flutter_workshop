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

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        //todo: listen to flutter for start/stop compass events
        compass = CompassService(this.context) { data: Double -> gotCompassData(flutterEngine, data)}

    }

    private fun gotCompassData(flutterEngine: FlutterEngine, azimuth: Double) {
        //TODO: call flutter from here
    }
}
