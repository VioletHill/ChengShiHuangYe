//
//  RhaphiolepsIndica.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "RhaphiolepisIndica.h"

@implementation RhaphiolepisIndica

- (id)init
{
    self = [super init];
    if (self)
    {
        [self bubble];
        self.plant=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rhaphiolepisIndica"]];
        self.plant.userInteractionEnabled=YES;
        self.plant.alpha=0;
        [self addSubview:self.plant];
        
        CGFloat plantWidth=self.plant.frame.size.width;
        CGFloat plantHeight=self.plant.frame.size.height;
        CGFloat bubbleWidth=self.bubble.frame.size.width;
        CGFloat bubbleHeight=self.bubble.frame.size.height;
        self.bubble.frame=CGRectMake(plantWidth, plantHeight/2-bubbleHeight/2, bubbleWidth, bubbleHeight);
        self.bubbleImage.frame=self.bubble.frame;
        self.plant.frame=CGRectMake(0, 0, plantWidth, plantHeight);
        self.frame=CGRectMake(0, 0, plantWidth+bubbleWidth, plantHeight);
    }
    return self;
}

@end
