package com.example.voice_assistant

import android.app.Service
import android.content.Intent
import android.os.IBinder
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class OverlayService : Service() {
    private lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()
        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flutter_overlay_window").invokeMethod("showOverlay", null)
    }

    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onDestroy() {
        flutterEngine.destroy()
        super.onDestroy()
    }
}
