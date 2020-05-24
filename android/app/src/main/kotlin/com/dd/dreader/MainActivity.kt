package com.dd.dreader

import androidx.annotation.NonNull;
import com.dd.dreader.custom.plugins.FlutterPluginJumpNativePage
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        //注册模块通道
        FlutterPluginJumpNativePage.registerWith(ShimPluginRegistry(flutterEngine)
                .registrarFor(FlutterPluginJumpNativePage.CHANNEL))
    }
}
