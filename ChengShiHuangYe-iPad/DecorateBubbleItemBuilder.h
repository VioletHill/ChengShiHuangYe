//
//  DecorateBubbleItemBuilder.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/6/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "DecorateBubbleItem.h"

@interface DecorateBubbleItemBuilder : DecorateBubbleItem

+(DecorateBubbleItemBuilder*) sharedDecorateBubbleItemBuilder;

@property (nonatomic,weak) SlideMenu* slideMenu;

-(NSMutableArray*) createDecorateBubble;

@end
