import { NativeModules } from 'react-native';

type BuglyType = {
  multiply(a: number, b: number): Promise<number>;
  setStrategy(
    AppChannel: string,
    AppVersion: string,
    AppPackageName: string
  ): void;
  setAppReportDelay(time: number): void;
  setSceneTag(tag: number): void;
  setIsDevelopmentDevice(isDebug: boolean): void; // android
};

const { Bugly } = NativeModules;

export default Bugly as BuglyType;
