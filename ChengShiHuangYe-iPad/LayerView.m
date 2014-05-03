//
//  LayerView.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "LayerView.h"
#import "Gravity.h"

@implementation LayerView

-(instancetype) init
{
    if (self=[super init])
    {
        self.frame=CGRectMake(0, 0, 1024, 768);
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


@end
