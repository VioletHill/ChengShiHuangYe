//
//  MenuButton.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/5/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SlideMenu.h"

@class SlideMenu;

@interface MenuButton : NSObject

-(instancetype) initWithRelyItem:(UIView*)relyItem;

-(void) bubbleClick;

@property (nonatomic,strong) UIButton* bubble;
@property (nonatomic,weak) SlideMenu* slideMenu;

@end
