//
//  CultureBubble1.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/6/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "CultureBubble1.h"

@implementation CultureBubble1

@synthesize bubble=_bubble;



-(void) bubbleClick:(id)sender
{
    [self.slideMenu cultureBubbleItemClick:sender];
}

@end
