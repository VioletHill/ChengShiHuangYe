//
//  PlantBubbleItemBuilder.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/7/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideMenu.h"

@interface PlantBubbleItemBuilder : NSObject

+(PlantBubbleItemBuilder*) sharedPlantBubbleItemBuilder;

@property (nonatomic,weak) SlideMenu* slideMenu;

-(NSMutableArray*) createPlantBubble;

@end
