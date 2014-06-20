//
//  PlantInfo.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "PlantInfo.h"

@implementation PlantInfo
{
    NSTimer* cancelTimer;
}

@synthesize bubble=_bubble;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(UIButton*) bubble
{
    if (_bubble==nil)
    {
        [self bubbleImage];
        _bubble=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [self.bubble addTarget:self action:@selector(plantToggle:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:_bubble];
    }
    return _bubble;
}

-(UIImageView*) bubbleImage
{
    if (_bubbleImage==nil)
    {
        _bubbleImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bubble"]];
        [self addSubview:_bubbleImage];
    }
    return _bubbleImage;
}

-(void) fadeOut:(UIView*)view complete:(void (^)(void) )complete
{
    [UIView animateWithDuration:1 animations:^(){
        view.alpha=0;
    }completion:^(BOOL finish){
        if (finish) complete();
    }];
}

-(void) fadeIn:(UIView*)view complete:(void (^)(void) )complete
{
    [UIView animateWithDuration:1 animations:^(){
        view.alpha=1;
    }completion:^(BOOL finish){
        if (finish) complete();
    }];
}

-(void) shine:(UIView*)view
{
    [self fadeIn:view complete:^(void){
        [self fadeOut:view complete:^(){
            [self shine:view];
        }];
    }];
}
-(void) showPlant:(id)sender
{
    NSLog(@"Plant Show");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.plant.alpha=1;
    [UIView commitAnimations];
}

-(void) hidePlant:(id)sender
{
    NSLog(@"Plant Hide");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.plant.alpha=0;
    [UIView commitAnimations];
}

-(void) plantToggle:(id)sender
{
    [cancelTimer invalidate];
    if (self.plant.alpha==0)
    {
        [self showPlant:sender];
        cancelTimer=[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(hidePlant:) userInfo:nil repeats:NO];
    }
    else
    {
        [self hidePlant:sender];
    }
}

-(void) bubbleShine
{
     [self shine:_bubbleImage];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
