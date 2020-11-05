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


RCT_EXPORT_METHOD(setStrategy:(nullable NSString *)AppChannel AppVersion:(nullable NSString *)AppVersion  AppPackageName:(nullable NSString *)AppPackageName )
{
  if(AppChannel){
    [Bugly setUserIdentifier:userId];
  }
  if(AppVersion){
    [Bugly updateAppVersion:AppVersion];
  }
  if(AppPackageName){
    [Bugly setAppPackageName:AppPackageName];
  }
}

RCT_EXPORT_METHOD(setAppReportDelay:(NSTimeInterval)time)
{
}

RCT_EXPORT_METHOD(setSceneTag:(NSUInteger)tag)
{
    [Bugly setTag:tag];
}

RCT_EXPORT_METHOD(setIsDevelopmentDevice:(BOOL )isDebug)
{
}
@end
