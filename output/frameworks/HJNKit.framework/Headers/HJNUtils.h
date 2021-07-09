//
//  HHWUtils.h
//  HHWFrameWork
//
//  Created by Hebert on 2020/7/30.
//  Copyright © 2020 hhw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJNUtils : NSObject
/// 单例
+ (instancetype)shareInstance;

- (void)showADView:(NSString *)dataStr rpStr:(NSString *)rpStr inViewController:(UIViewController *)inViewController;

- (UIViewController *)getADView:(NSString *)dataStr rpStr:(NSString *)rpStr;

@end

NS_ASSUME_NONNULL_END
