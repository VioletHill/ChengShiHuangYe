//
//  DecorateBubbleItemBuilder.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/6/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "DecorateBubbleItemBuilder.h"
#import "DecorateBubbleItem1.h"
#import "DecorateBubbleItem2.h"
#import "DecorateBubbleItem3.h"

@implementation DecorateBubbleItemBuilder

+(DecorateBubbleItemBuilder*) sharedDecorateBubbleItemBuilder
{
    static DecorateBubbleItemBuilder* _sharedDecoreateBubbleItemBuilder;
    static dispatch_once_t decorateToken;
    dispatch_once(&decorateToken, ^(void){
        _sharedDecoreateBubbleItemBuilder=[[DecorateBubbleItemBuilder alloc] init];
    });
    return _sharedDecoreateBubbleItemBuilder;
}

-(NSMutableArray*) createDecorateBubble
{
    NSMutableArray* container=[[NSMutableArray alloc] init];
    
    DecorateBubbleItem1* item1=[[DecorateBubbleItem1 alloc] initWithRelyItem:self.slideMenu.decorateSoil];
    [container addObject:item1];
    
    DecorateBubbleItem2* item2=[[DecorateBubbleItem2 alloc] initWithRelyItem:self.slideMenu.decorateSoil];
    [container addObject:item2];
    
    DecorateBubbleItem3* item3=[[DecorateBubbleItem3 alloc] initWithRelyItem:self.slideMenu.decorateSoil];
    [container addObject:item3];
    
    return container;
}

@end
