package com.codesomethingdaily.flutter_android_opencc

import android.content.Context
import androidx.annotation.NonNull
import com.zqc.opencc.android.lib.ChineseConverter
import com.zqc.opencc.android.lib.ConversionType
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterAndroidOpenccPlugin */
class FlutterAndroidOpenccPlugin : FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(
      @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
  ) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_android_opencc")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "convert") {
      var text: String = call.argument("text") ?: ""
      var conversionType: String = call.argument("ConversionType") ?: ""
      if (text == "" || conversionType == "") {
        result.error("NullException", "conversion failed", null)
        return
      }
      lateinit var _conversionType: ConversionType

      try {
        _conversionType = ConversionType.valueOf(conversionType)
      } catch (e: IllegalArgumentException) {
        result.error("IllegalArgumentException", "conversion type not found", null)
        return
      }
      result.success(ChineseConverter.convert(text, _conversionType, context))
      return
      // valueOf
    } else if (call.method == "clearDictDataFolder") {
      ChineseConverter.clearDictDataFolder(context)
      return
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
