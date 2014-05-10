//
//  DecorateBubbleItem3.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/6/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "DecorateBubbleItem3.h"

@implementation DecorateBubbleItem3

@synthesize bubble=_bubble;

-(instancetype) initWithRelyItem:(UIView*)relyItem
{
    if (self=[super init])
    {
        CGFloat positionX=relyItem.frame.origin.x+relyItem.frame.size.width;
        CGFloat positionY=relyItem.frame.origin.y+self.space+85+90;
        
        _bubble=[[UIButton alloc] initWithFrame:CGRectMake(positionX, positionY, 137, 119)];
        [_bubble setImage:[UIImage imageNamed:@"decorateBubble3"] forState:UIControlStateNormal];
        [_bubble addTarget:self action:@selector(bubbleClick:) forControlEvents:UIControlEventTouchUpInside];
        [relyItem.superview addSubview:_bubble];
        
        self.slideMenu=(SlideMenu*)relyItem.superview;
        self.bubble.alpha=0;
    }
    return self;
}

-(void) bubbleClick:(id)sender
{
    NSLog(@"%f",((UIButton*)sender).frame.origin.y);
    [self.slideMenu decorateBubbleItemClick:sender];
}

@end
