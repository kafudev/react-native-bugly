import { NativeModules } from 'react-native';

type BuglyType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Bugly } = NativeModules;

export default Bugly as BuglyType;
