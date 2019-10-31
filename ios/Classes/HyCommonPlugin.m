#import "HyCommonPlugin.h"
#import <hy_common/hy_common-Swift.h>

@implementation HyCommonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHyCommonPlugin registerWithRegistrar:registrar];
}
@end
