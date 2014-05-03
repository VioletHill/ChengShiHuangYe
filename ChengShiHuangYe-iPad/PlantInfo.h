//
//  PlantInfo.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlantInfo : UIView

@property (nonatomic,strong) UIButton* bubble;
@property (nonatomic,strong) UIImageView* bubbleImage;
@property (nonatomic,strong) UIView* plant;

-(void) showPlant:(id)sender;

-(void) hidePlant:(id)sender;

@end
