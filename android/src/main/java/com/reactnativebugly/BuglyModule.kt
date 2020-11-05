package com.reactnativebugly

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.tencent.bugly.crashreport.CrashReport

class BuglyModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "Bugly"
    }

    // Example method
    // See https://facebook.github.io/react-native/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {
      promise.resolve(a * b)
    }

    // 设置strategy版本信息
    @ReactMethod
    fun setStrategy(AppChannel: String, AppVersion: String, AppPackageName: String) {
      if(AppChannel){
        CrashReport.setAppChannel(AppChannel);  //设置渠道
      }
      if(AppVersion){
        CrashReport.setAppVersion(AppVersion);      //App的版本
      }
      if(AppPackageName){
        CrashReport.setAppPackage(AppPackageName);  //App的包名
      }
    }

    // 设置Bugly初始化延迟
    @ReactMethod
    fun setAppReportDelay(time: Int) {
      // jar包有问题
      // CrashReport.setAppReportDelay(time)
    }

    // 设置标签
    @ReactMethod
    fun setSceneTag(tag: Int) {
      CrashReport.setUserSceneTag(reactContext, tag)
    }

    // 设置是否开发设备
    @ReactMethod
    fun setIsDevelopmentDevice(isDebug: Boolean) {
      CrashReport.setIsDevelopmentDevice(reactContext, isDebug)
    }

}
