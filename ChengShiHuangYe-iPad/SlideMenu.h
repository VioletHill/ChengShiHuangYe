//
//  SlideMenu.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/4/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleViewController.h"
#import "MenuButton.h"

@interface SlideMenu : UIView

@property (nonatomic,weak) SampleViewController* sampleViewController;

@property (nonatomic,strong) UIButton* coarseSoil;
@property (nonatomic,strong) UIButton* cultureSoil;
@property (nonatomic,strong) UIButton* decorateSoil;
@property (nonatomic,strong) UIButton* plant;

@property (nonatomic,strong) NSMutableArray* coarseMenuArray;
@property (nonatomic,strong) NSMutableArray* cultureMenuArray;
@property (nonatomic,strong) NSMutableArray* decorateMenuArray;
@property (nonatomic,strong) NSMutableArray* plantMenuArray;

-(void) coarseBubbleItemClick:(id)sender;
-(void) cultureBubbleItemClick:(id)sender;
-(void) decorateBubbleItemClick:(id)sender;
-(void) plantItemClick:(id)sender;

@end
