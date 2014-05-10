//
//  CultureBubbleItemBuilder.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/6/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "CultureBubble.h"

@interface CultureBubbleItemBuilder : CultureBubble

+(CultureBubbleItemBuilder*) sharedCultrueBubbleItemBuilder;

@property (nonatomic,weak) SlideMenu* slideMenu;

-(NSMutableArray*) createCultureBubble;

@end
