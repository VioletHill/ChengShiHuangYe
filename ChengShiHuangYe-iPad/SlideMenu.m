//
//  SlideMenu.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/4/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "SlideMenu.h"

#import "CoarseBubbleItemBuilder.h"
#import "CultureBubbleItemBuilder.h"
#import "DecorateBubbleItemBuilder.h"
#import "PlantBubbleItemBuilder.h"

@interface SlideMenu ()

@end

@implementation SlideMenu
{
    BOOL isShow;
}

@synthesize coarseSoil=_coarseSoil;
@synthesize cultureSoil=_cultureSoil;
@synthesize decorateSoil=_decorateSoil;
@synthesize plant=_plant;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(instancetype) init
{
    if (self=[super init])
    {
        self.frame=CGRectMake(-170, 0, 403, 768);
        [self setBg];
        [self addGesture];
        [self addMenuItem];
        [self addMenuBubble];
        [self addMenuIcon];
    }
    return self;
}

-(void) addGesture
{
    UIPanGestureRecognizer* gesture=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self addGestureRecognizer:gesture];
}

-(void) panGesture:(UIPanGestureRecognizer*)gesture
{
    static CGPoint startPanPoint;
    static CGFloat viewPositionX;
    if (gesture.state==UIGestureRecognizerStateBegan)
    {
        startPanPoint=[gesture translationInView:self];
        viewPositionX=self.frame.origin.x;
    }
    else if (gesture.state==UIGestureRecognizerStateCancelled || gesture.state==UIGestureRecognizerStateEnded || gesture.state==UIGestureRecognizerStateFailed)
    {
        [self resetMenu];
    }
    else if (gesture.state==UIGestureRecognizerStateChanged)
    {
        CGPoint nowPoint=[gesture translationInView:self];
        CGFloat positionX=nowPoint.x-startPanPoint.x;
        CGFloat newPositionX=viewPositionX+positionX;
        newPositionX=MIN(newPositionX, 0);
        newPositionX=MAX(newPositionX, -170);
        self.frame=CGRectMake(newPositionX, 0, self.frame.size.width, self.frame.size.height);
    }
}

-(void) closeMenuWithTime:(CGFloat)time
{
    [self hideAllBubble];
    [UIView animateWithDuration:time animations:^(void){
        self.frame=CGRectMake(-170, 0, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finish){
        if (finish) isShow=NO;
    }];
}

-(void) openMenuWithTime:(CGFloat)time
{
    [UIView animateWithDuration:time animations:^(void){
        self.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }completion:^(BOOL finish){
        if (finish) isShow=YES;
    }];
}

-(void) resetMenu
{
    CGFloat positionX=self.frame.origin.x;
    if (positionX>-170/2) [self openMenuWithTime:fabs(positionX)/170];
    else [self closeMenuWithTime:fabs(170+positionX)/170];

}

-(void) toggleMenu
{
    CGFloat positionX=self.frame.origin.x;
    if (positionX>-170/2) [self closeMenuWithTime:fabs(positionX+170)/170/2];
    else [self openMenuWithTime:fabs(positionX)/170/2];
}

-(void) setBg
{
    UIImageView* image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slideMenuBg"]];
    image.userInteractionEnabled=YES;
    
    [self addSubview:image];
}

-(void) addMenuIcon
{
    UIButton* menu=[[UIButton alloc] initWithFrame:CGRectMake(220, 30, 48, 52)];
    [menu setImage:[UIImage imageNamed:@"slideMenuIcon"] forState:UIControlStateNormal];
    [menu addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:menu];
}

#pragma mark - menu item

-(void) addMenuItem
{
    CGFloat positionY=20;
    CGFloat space=10;
    //slide1
    UIImageView* slideMenu=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slideMenu"]];
    slideMenu.frame=CGRectMake(0, positionY, slideMenu.frame.size.width, slideMenu.frame.size.height);
    [self addSubview:slideMenu];
    positionY=positionY+slideMenu.frame.size.height+space;
    
    //slide2
    UIButton* logoButton=[[UIButton alloc] initWithFrame:CGRectMake(14, positionY, 142, 104)];
    [logoButton setImage:[UIImage imageNamed:@"slideLogo"] forState:UIControlStateNormal];
    [logoButton addTarget:self action:@selector(logoClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:logoButton];
    positionY=positionY+logoButton.frame.size.height+space;
    
    //slide 3
    _coarseSoil=[[UIButton alloc] initWithFrame:CGRectMake(14, positionY, 142, 113)];
    [_coarseSoil setImage:[UIImage imageNamed:@"slide3"] forState:UIControlStateNormal];
    [_coarseSoil addTarget:self action:@selector(coarseSoilToggle) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_coarseSoil];
    positionY=positionY+_coarseSoil.frame.size.height+space;
    
    //slide4
    _cultureSoil=[[UIButton alloc] initWithFrame:CGRectMake(14, positionY, 142, 115)];
    [_cultureSoil setImage:[UIImage imageNamed:@"slide4"] forState:UIControlStateNormal];
    [_cultureSoil addTarget:self action:@selector(cultureSoilToggle) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cultureSoil];
    positionY=positionY+_cultureSoil.frame.size.height+space;
    
    //slide5
    _decorateSoil=[[UIButton alloc] initWithFrame:CGRectMake(14, positionY, 142, 103)];
    [_decorateSoil setImage:[UIImage imageNamed:@"slide5"] forState:UIControlStateNormal];
    [_decorateSoil addTarget:self action:@selector(decorateSoilToggle) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_decorateSoil];
    positionY=positionY+_decorateSoil.frame.size.height+space;
    
    //slide6
    _plant=[[UIButton alloc] initWithFrame:CGRectMake(14, positionY, 142, 117)];
    [_plant setImage:[UIImage imageNamed:@"slide6"] forState:UIControlStateNormal];
    [_plant addTarget:self action:@selector(plantToggle) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_plant];
    positionY=positionY+_plant.frame.size.height+space;
    
    //about us
    UIButton* aboutUs=[[UIButton alloc] initWithFrame:CGRectMake(28, positionY+10, 112, 30)];
    [aboutUs setImage:[UIImage imageNamed:@"aboutUs"] forState:UIControlStateNormal];
    [aboutUs addTarget:self action:@selector(aboutUsClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:aboutUs];
    positionY=positionY+aboutUs.frame.size.height+space+10;
    
}

-(BOOL) isAlreadyShow:(UIView*)view
{
    if (view.alpha!=0) return YES;
    else return NO;
}

-(void) hideAllBubble
{
    [self coarseSoilHide];
    [self cultureSoilHide];
    [self decorateSoilHide];
    [self plantHide];
}

-(void) coarseSoilShow
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.coarseMenuArray)
    {
        obj.bubble.alpha=1;
    }
    [UIView commitAnimations];
}

-(void) coarseSoilHide
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.coarseMenuArray)
    {
        obj.bubble.alpha=0;
    }
    [UIView commitAnimations];
}

-(void) coarseSoilToggle
{
    MenuButton* firstObj=[self.coarseMenuArray firstObject];
    if ([self isAlreadyShow:firstObj.bubble])
    {
        [self coarseSoilHide];
    }
    else
    {
        [self hideAllBubble];
        [self coarseSoilShow];
    }
}

-(void) cultureSoilShow
{
    NSLog(@"culture Show");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.cultureMenuArray)
    {
        obj.bubble.alpha=1;
    }
    [UIView commitAnimations];
}

-(void) cultureSoilHide
{
    NSLog(@"culture Show");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.cultureMenuArray)
    {
        obj.bubble.alpha=0;
    }
    [UIView commitAnimations];
}

-(void) cultureSoilToggle
{
    MenuButton* firstObj=[self.cultureMenuArray firstObject];
    if ([self isAlreadyShow:firstObj.bubble])
    {
        [self cultureSoilHide];
    }
    else
    {
        [self hideAllBubble];
        [self cultureSoilShow];
    }
}

-(void) decorateSoilShow
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.decorateMenuArray)
    {
        obj.bubble.alpha=1;
    }
    [UIView commitAnimations];
}

-(void) decorateSoilHide
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.decorateMenuArray)
    {
        obj.bubble.alpha=0;
    }
    [UIView commitAnimations];
}

-(void) decorateSoilToggle
{
    MenuButton* firstObj=[self.decorateMenuArray firstObject];
    if ([self isAlreadyShow:firstObj.bubble])
    {
        [self decorateSoilHide];
    }
    else
    {
        [self hideAllBubble];
        [self decorateSoilShow];
    }
}

-(void) plantShow
{
    NSLog(@"plant show");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.plantMenuArray)
    {
        obj.bubble.alpha=1;
    }
    [UIView commitAnimations];
}

-(void) plantHide
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    for (MenuButton* obj in self.plantMenuArray)
    {
        obj.bubble.alpha=0;
    }
    [UIView commitAnimations];

}

-(void) plantToggle
{
    MenuButton* firstObj=[self.plantMenuArray firstObject];
    if ([self isAlreadyShow:firstObj.bubble])
    {
        [self plantHide];
    }
    else
    {
        [self hideAllBubble];
        [self plantShow];
    }
}

-(void) logoClick
{
    [self.sampleViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - menu bubble 

-(void) addMenuBubble
{
    CoarseBubbleItemBuilder* coarseBuilder=[CoarseBubbleItemBuilder sharedCoarseBubbleItemBuilder];
    coarseBuilder.slideMenu=self;
    self.coarseMenuArray=[coarseBuilder createCoarseBubble];
    
    CultureBubbleItemBuilder* cultureBuilder=[CultureBubbleItemBuilder sharedCultrueBubbleItemBuilder];
    cultureBuilder.slideMenu=self;
    self.cultureMenuArray=[cultureBuilder createCultureBubble];
    
    DecorateBubbleItemBuilder* decorateBuilder=[DecorateBubbleItemBuilder sharedDecorateBubbleItemBuilder];
    decorateBuilder.slideMenu=self;
     self.decorateMenuArray=[decorateBuilder createDecorateBubble];
    
    PlantBubbleItemBuilder* plantBuilder=[PlantBubbleItemBuilder sharedPlantBubbleItemBuilder];
    plantBuilder.slideMenu=self;
    self.plantMenuArray=[plantBuilder createPlantBubble];
}

#pragma mark - bubble click

-(void) coarseBubbleItemClick:(id)sender
{
    for (int i=0; i<self.coarseMenuArray.count; i++)
    {
        MenuButton* obj=self.coarseMenuArray[i];
        if (sender==obj.bubble)
        {
            [self.sampleViewController setCoarseImageWithName:[NSString stringWithFormat:@"coarseSoil%d",i+1]];
            break;
        }
    }
    [self coarseSoilHide];
}


-(void) cultureBubbleItemClick:(id)sender
{
    for (int i=0; i<self.cultureMenuArray.count; i++)
    {
        MenuButton* obj=self.cultureMenuArray[i];
        if (sender==obj.bubble)
        {
            [self.sampleViewController setCultureImageWithName:[NSString stringWithFormat:@"cultureSoil%d",i+1]];
            break;
        }
    }
    [self cultureSoilHide];
}

-(void) decorateBubbleItemClick:(id)sender
{
    for (int i=0; i<self.decorateMenuArray.count; i++)
    {
        MenuButton* obj=self.decorateMenuArray[i];
        if (sender==obj.bubble)
        {
            [self.sampleViewController setDecorateImageWithName:[NSString stringWithFormat:@"decorateSoil%d",i+1]];
            break;
        }
    }
    [self decorateSoilHide];
}

-(void) plantItemClick:(id)sender
{
    for (int i=0; i<self.plantMenuArray.count; i++)
    {
        MenuButton* obj=self.plantMenuArray[i];
        if (sender==obj.bubble)
        {
            [self.sampleViewController showPlantWithName:[NSString stringWithFormat:@"plant%d",i+1]];
            break;
        }
    }
}

-(void) aboutUsClick:(id)sender
{
    [self hideAllBubble];
    [self.sampleViewController showAbout];
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
