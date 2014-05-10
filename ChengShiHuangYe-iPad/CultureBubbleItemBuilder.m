//
//  CultureBubbleItemBuilder.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/6/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "CultureBubbleItemBuilder.h"
#import "CultureBubble1.h"
#import "CultureBubble2.h"

@implementation CultureBubbleItemBuilder

+(CultureBubbleItemBuilder*) sharedCultrueBubbleItemBuilder
{
    static CultureBubbleItemBuilder* _sharedCultureBubbleItemBuilder;
    static dispatch_once_t cultureBubbleToken;
    dispatch_once(&cultureBubbleToken, ^(void){
        _sharedCultureBubbleItemBuilder=[[CultureBubbleItemBuilder alloc] init];
    });
    return _sharedCultureBubbleItemBuilder;
}

-(NSMutableArray*) createCultureBubble
{
    NSMutableArray* container=[[NSMutableArray alloc] init];
    
    CultureBubble1* bubble1=[[CultureBubble1 alloc] initWithRelyItem:self.slideMenu.cultureSoil];
    [container addObject:bubble1];
    
    CultureBubble2* bubble2=[[CultureBubble2 alloc] initWithRelyItem:self.slideMenu.cultureSoil];
    [container addObject:bubble2];
    
    return container;
}

@end
