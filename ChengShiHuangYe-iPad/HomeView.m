//
//  HomeView.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "HomeView.h"
#import "Gravity.h"
#import "HomeViewPlantBuilder.h"

@interface HomeView ()

@property (nonatomic,strong) NSTimer* gravityTimer;
@property (nonatomic,strong) UIImageView* treeView;

@property (nonatomic,strong) NSMutableArray* plantInfo;

@end

@implementation HomeView

- (instancetype) init
{
    self=[super init];
    if (self)
    {
        UIImageView* bg=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeBg"]];
        [self addSubview:bg];   //bg
        [self treeView];        //tree
        [self plantInfo];
        [self addLogo];
    }
    return self;
}

-(NSMutableArray*) plantInfo
{
    if (_plantInfo==nil)
    {
        _plantInfo=[HomeViewPlantBuilder createInLayerView:self];
    }
    return _plantInfo;
}

-(NSTimer*) gravityTimer
{
    if (_gravityTimer==nil)
    {
        _gravityTimer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(setTree) userInfo:nil repeats:YES];
    }
    return _gravityTimer;
}

-(UIImageView*) treeView
{
    if (_treeView==nil)
    {
        _treeView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"homeTree"]];
        [self addSubview:_treeView];
    }
    return _treeView;
}

-(void) gotoNextView:(id)sender
{
    [self leaveLayer];
    [self.controllerDelegate gotoNextController];
}

-(void) addLogo
{
    UIButton* logo=[[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2-110, self.frame.size.height/2-110, 220, 220)];
    [logo setImage:[UIImage imageNamed:@"logo"] forState:UIControlStateNormal];
    [logo addTarget:self action:@selector(gotoNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:logo];
}

-(void) setTreeWithPositionY:(CGFloat)positionY
{
    CGRect treeFrame=CGRectMake(self.treeView.frame.origin.x, positionY, self.treeView.frame.size.width, self.treeView.frame.size.height);
    self.treeView.frame=treeFrame;
}

-(void) setTree
{
  //  NSLog(@"set Tree");
    CGFloat maxOffsetY=-50;
    Gravity* gravity=[Gravity sharedGravity];
    CMAcceleration accelerometer=[gravity getGravity];
    [self setTreeWithPositionY:(accelerometer.z+0.5)*maxOffsetY-25];
}

#pragma mark - state design pattern implementation LayerView abstract method

-(void) enterLayer
{
    Gravity* gravity=[Gravity sharedGravity];
    [gravity startMotion];
    [self.gravityTimer fire];
    
    for (PlantInfo* obj in self.plantInfo)
    {
        [obj bubbleShine];
    }
}

-(void) leaveLayer
{
    Gravity* gravity=[Gravity sharedGravity];
    [self.gravityTimer invalidate];
    self.gravityTimer=nil;
    [gravity stopMotion];
}

@end
