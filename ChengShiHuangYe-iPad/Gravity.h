//
//  Gravity.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface Gravity : NSObject

+(Gravity*) sharedGravity;

-(CMAcceleration) getGravity;

-(void) startMotion;

-(void) stopMotion;

@end
