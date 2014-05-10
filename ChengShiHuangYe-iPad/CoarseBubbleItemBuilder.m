//
//  CoarseBubbleItemBuilder.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/5/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "CoarseBubbleItemBuilder.h"
#import "CoarseBubbleItem1.h"
#import "CoarseBubbleItem2.h"

@implementation CoarseBubbleItemBuilder

+(CoarseBubbleItemBuilder*) sharedCoarseBubbleItemBuilder
{
    static CoarseBubbleItemBuilder* _sharedCoarseBubbleItemBuilder=nil;
    static dispatch_once_t coarseBubbleItemToken;
    dispatch_once(&coarseBubbleItemToken, ^(){
        _sharedCoarseBubbleItemBuilder=[[CoarseBubbleItemBuilder alloc] init];
    });
    return _sharedCoarseBubbleItemBuilder;
}

-(NSMutableArray*) createCoarseBubble
{
    NSMutableArray* container=[[NSMutableArray alloc] init];
    
    CoarseBubbleItem1* item1=[[CoarseBubbleItem1 alloc] initWithRelyItem:self.slideMenu.coarseSoil];
    [container addObject:item1];
    
    CoarseBubbleItem2* item2=[[CoarseBubbleItem2 alloc] initWithRelyItem:self.slideMenu.coarseSoil];
    [container addObject:item2];
    
    return container;
}

@end
