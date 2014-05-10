//
//  SampleViewController.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/3/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IIViewDeckController.h>

@interface SampleViewController : UIViewController

-(void) setCoarseImageWithName:(NSString*)imageName;

-(void) setCultureImageWithName:(NSString*)imageName;

-(void) setDecorateImageWithName:(NSString*)imageName;

-(void) showPlantWithName:(NSString*)plantName;

-(void) showAbout;

@end
