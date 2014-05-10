//
//  PlantBubbleItemBuilder.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/7/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "PlantBubbleItemBuilder.h"

#import "PlantBubble1.h"
#import "PlantBubble2.h"
#import "PlantBubble3.h"
#import "PlantBubble4.h"
#import "PlantBubble5.h"
#import "PlantBubble6.h"
#import "PlantBubble7.h"

@implementation PlantBubbleItemBuilder

+(PlantBubbleItemBuilder*) sharedPlantBubbleItemBuilder
{
    static PlantBubbleItemBuilder* _sharedPlantBubbleItemBuilder;
    static dispatch_once_t plantToken;
    dispatch_once(&plantToken, ^(void){
        _sharedPlantBubbleItemBuilder=[[PlantBubbleItemBuilder alloc] init];
    });
    return _sharedPlantBubbleItemBuilder;
}

-(NSMutableArray*) createPlantBubble
{
    NSMutableArray* container=[[NSMutableArray alloc] init];
    
    PlantBubble7* plant7=[[PlantBubble7 alloc] initWithRelyItem:self.slideMenu.plant];
    PlantBubble6* plant6=[[PlantBubble6 alloc] initWithRelyItem:self.slideMenu.plant];
    PlantBubble5* plant5=[[PlantBubble5 alloc] initWithRelyItem:self.slideMenu.plant];
    
    PlantBubble4* plant4=[[PlantBubble4 alloc] initWithRelyItem:self.slideMenu.plant];
    PlantBubble3* plant3=[[PlantBubble3 alloc] initWithRelyItem:self.slideMenu.plant];
    PlantBubble2* plant2=[[PlantBubble2 alloc] initWithRelyItem:self.slideMenu.plant];
    PlantBubble1* plant1=[[PlantBubble1 alloc] initWithRelyItem:self.slideMenu.plant];

    [container addObject:plant1];
    [container addObject:plant2];
    [container addObject:plant3];
    [container addObject:plant4];
    [container addObject:plant5];
    [container addObject:plant6];
    [container addObject:plant7];
    
    return container;
}

@end
