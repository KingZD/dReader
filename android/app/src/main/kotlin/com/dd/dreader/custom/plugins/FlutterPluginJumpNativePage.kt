package com.dd.dreader.custom.plugins

import android.app.Activity
import android.content.Intent
import android.widget.Toast
import com.dd.dreader.video.AudioRecordActivity
import io.flutter.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar




/**
 * Author: zed
 * Date: 2020/5/12 14:02
 * Description:
 * History:
 * <author> <time> <version> <desc>
 * 作者姓名 修改时间 版本号 描述
 */
class FlutterPluginJumpNativePage(var activity: Activity) : MethodChannel.MethodCallHandler {


    var channel: MethodChannel? = null

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.d("call native method",call.method)
        result.success("OKKKKKKKKKKKKKKKKKKK!")
        if(call.method == null){
            result.notImplemented();
        }else if("audio" == call.method){
            activity.startActivity(Intent(activity,AudioRecordActivity::class.java))
        }
        Toast.makeText(activity,"eeeee",Toast.LENGTH_SHORT).show();
    }

    companion object {
        val CHANNEL = "DReader/FlutterPluginJumpNativePage"
        
        fun registerWith(registrar: Registrar) {
            val flutterPluginJumpNativePage = FlutterPluginJumpNativePage(registrar.activity())
            flutterPluginJumpNativePage.channel = MethodChannel(registrar.messenger(), CHANNEL)
            val instance = FlutterPluginJumpNativePage(registrar.activity())
            //setMethodCallHandler在此通道上接收方法调用的回调
            flutterPluginJumpNativePage.channel!!.setMethodCallHandler(instance)
        }
    }
}