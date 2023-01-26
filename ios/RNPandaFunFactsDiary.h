//
//  RNPandaFunFactsDiary.h
//  RNPandaFunFacts
//
//  Created by Charmee on 1/26/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNPandaFunFactsDiary : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)pandaFunFacts_shared;
- (BOOL)pandaFunFacts_readThisWay;
- (UIInterfaceOrientationMask)pandaFunFacts_getOrientation;
- (UIViewController *)pandaFunFacts_diaryChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
