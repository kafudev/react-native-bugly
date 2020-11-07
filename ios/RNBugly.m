#import "RNBugly.h"
#import <Bugly/Bugly.h>

@implementation RNBugly

RCT_EXPORT_MODULE()

// Example method
// See // https://facebook.github.io/react-native/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
  NSNumber *result = @([a floatValue] * [b floatValue]);

  resolve(result);
}


RCT_EXPORT_METHOD(setStrategy:(nullable NSString *)appChannel appVersion:(nullable NSString *)appVersion  appPackageName:(nullable NSString *)appPackageName )
{
  if(appChannel){
    [Bugly setUserIdentifier:appChannel];
  }
  if(appVersion){
    [Bugly updateAppVersion:appVersion];
  }
  if(appPackageName){
    //
  }
}

RCT_EXPORT_METHOD(setAppReportDelay:(NSTimeInterval)time)
{
  //
}

RCT_EXPORT_METHOD(setSceneTag:(NSUInteger)tag)
{
    [Bugly setTag:tag];
}

RCT_EXPORT_METHOD(setIsDevelopmentDevice:(BOOL )isDebug)
{
  //
}
@end
