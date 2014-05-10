//
//  CoarseBubbleItemBuilder.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/5/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideMenu.h"

@interface CoarseBubbleItemBuilder : NSObject

+(CoarseBubbleItemBuilder*) sharedCoarseBubbleItemBuilder;

@property (nonatomic,weak) SlideMenu* slideMenu;

-(NSMutableArray*) createCoarseBubble;

@end
