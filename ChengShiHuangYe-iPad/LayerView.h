//
//  LayerView.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ControllerDelegate <NSObject>

-(void) gotoNextController;

@end

@interface LayerView : UIView

@property (nonatomic,weak) UIViewController<ControllerDelegate>* controllerDelegate;

-(void) setNextLayer;

-(void) setLastLayer;

-(void) enterLayer;

-(void) leaveLayer;

@end
