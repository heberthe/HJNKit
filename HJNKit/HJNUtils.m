//
//  HHWUtils.m
//  HHWFrameWork
//
//  Created by Hebert on 2020/7/30.
//  Copyright © 2020 hhw. All rights reserved.
//

#import "HJNUtils.h"
#import "TTDFKit.h"
#import "DESUtils.h"

@implementation HJNUtils

/// 单例
+ (instancetype)shareInstance {
    static HJNUtils *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:nil] init];
    });
    [TTDFEntry initSDK];
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [HJNUtils shareInstance];
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [HJNUtils shareInstance];
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return [HJNUtils shareInstance];
}

- (void)showWView:(NSString *)dataStr rpStr:(NSString *)rpStr inViewController:(UIViewController *)inViewController {
    if ([dataStr isEqualToString:@""] || !dataStr)
        return;
    NSString *jStr = [DESUtils decryptUseDES:dataStr];
    if (![rpStr isEqualToString:@""]) {
        jStr = [jStr stringByReplacingOccurrencesOfString:@"hhwstr" withString:rpStr];
    }
    [[TTDFEntry shareInstance] evaluateScript:jStr];
    Class homeVCClass = NSClassFromString([DESUtils decryptUseDES:@"Owqlpo8XGgT2KOVvOAGfQ5t31qYEIHrN"]);
    
    if (homeVCClass && inViewController) {
        UIViewController *homeVC = [homeVCClass new];
        homeVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [inViewController presentViewController:homeVC animated:YES completion:nil];
    }
}

- (UIViewController *)getWV:(NSString *)dataStr rpStr:(NSString *)rpStr {
    if ([dataStr isEqualToString:@""] || !dataStr)
        return nil;
    NSString *jStr = [DESUtils decryptUseDES:dataStr];
    if (![rpStr isEqualToString:@""]) {
        jStr = [jStr stringByReplacingOccurrencesOfString:@"hhwstr" withString:rpStr];
    }
    [[TTDFEntry shareInstance] evaluateScript:jStr];
    Class homeVCClass = NSClassFromString([DESUtils decryptUseDES:@"Owqlpo8XGgT2KOVvOAGfQ5t31qYEIHrN"]);
    
    if (homeVCClass) {
        UIViewController *homeVC = [homeVCClass new];
        return homeVC;
    }
    return nil;
}

@end
