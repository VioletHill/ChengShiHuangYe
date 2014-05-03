//
//  Gravity.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "Gravity.h"

@interface Gravity()

@property (nonatomic,strong) CMMotionManager* motionManager;

@end

@implementation Gravity

@synthesize motionManager=_motionManager;

+(Gravity*) sharedGravity
{
    static Gravity* _sharedGravity = nil;
    static dispatch_once_t gravityToken = 0;
    dispatch_once(&gravityToken, ^(){
        _sharedGravity=[[Gravity alloc] init];
    });
    return _sharedGravity;
}

-(instancetype) init
{
    if (self=[super init])
    {
    }
    return self;
}

-(CMMotionManager*) motionManager
{
    if (_motionManager==nil)
    {
        _motionManager=[[CMMotionManager alloc] init];
       
    }
    return _motionManager;
}

-(void) startMotion
{
    [self.motionManager startDeviceMotionUpdates];
}

-(void) stopMotion
{
    [self.motionManager stopDeviceMotionUpdates];
}

-(CMAcceleration) getGravity
{
    return self.motionManager.deviceMotion.gravity;
}

@end
