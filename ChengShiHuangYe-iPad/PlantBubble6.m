//
//  PlantBubble6.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/7/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "PlantBubble6.h"

@implementation PlantBubble6

@synthesize bubble=_bubble;

-(instancetype) initWithRelyItem:(UIView*)relyItem
{
    if (self=[super init])
    {
        CGFloat positionX=relyItem.frame.origin.x+relyItem.frame.size.width+70;
        CGFloat positionY=relyItem.frame.origin.y-20;
        
        _bubble=[[UIButton alloc] initWithFrame:CGRectMake(positionX, positionY, 184, 112)];
        [_bubble setImage:[UIImage imageNamed:@"plantBubble6"] forState:UIControlStateNormal];
        [_bubble addTarget:self action:@selector(bubbleClick:) forControlEvents:UIControlEventTouchUpInside];
        [relyItem.superview addSubview:_bubble];
        
        self.slideMenu=(SlideMenu*)relyItem.superview;
        self.bubble.alpha=0;
    }
    return self;
}

-(void) bubbleClick:(id)sender
{
    [self.slideMenu plantItemClick:sender];
}


@end
