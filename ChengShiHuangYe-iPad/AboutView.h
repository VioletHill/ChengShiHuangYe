//
//  AboutView.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/10/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AboutLeaveProtocol <NSObject>

-(void) aboutLeaveDone;

@end

@interface AboutView : UIView

+(AboutView*) createInController:(UIViewController*)controller;

@property (nonatomic,weak) id<AboutLeaveProtocol> delegate;

-(void) show;

@end
