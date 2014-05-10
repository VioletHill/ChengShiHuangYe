//
//  SampleViewController.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/3/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "SampleViewController.h"
#import "SlideMenu.h"
#import "AboutView.h"

@interface SampleViewController ()<AboutLeaveProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *doubleClickGuide;

@property (weak, nonatomic) IBOutlet UIView *boxContainerView;

@property (nonatomic,strong) SlideMenu* slideMenu;
@property (weak, nonatomic) IBOutlet UIImageView *coarseSoil;
@property (weak, nonatomic) IBOutlet UIImageView *cultureSoil;
@property (weak, nonatomic) IBOutlet UIImageView *decorateSoil;


@property (weak, nonatomic) IBOutlet UIImageView *plant1;
@property (weak, nonatomic) IBOutlet UIImageView *plant2;
@property (weak, nonatomic) IBOutlet UIImageView *plant3;
@property (weak, nonatomic) IBOutlet UIImageView *plant4;
@property (weak, nonatomic) IBOutlet UIImageView *plant5;
@property (weak, nonatomic) IBOutlet UIImageView *plant6;
@property (weak, nonatomic) IBOutlet UIImageView *plant7;

@property (nonatomic,strong)  NSMutableArray* boxContainer;

@property (nonatomic,strong) AboutView* aboutView;

@end

@implementation SampleViewController

@synthesize slideMenu=_slideMenu;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - getter & setter

-(SlideMenu*) slideMenu
{
    if (_slideMenu==nil)
    {
        _slideMenu=[[SlideMenu alloc] init];
    }
    return _slideMenu;
}

-(NSMutableArray*) boxContainer
{
    if (_boxContainer==nil)
    {
        _boxContainer=[[NSMutableArray alloc] init];
    }
    return _boxContainer;
}

-(AboutView*) aboutView
{
    if (_aboutView==nil)
    {
        _aboutView=[AboutView createInController:self];
        _aboutView.frame=CGRectMake(-_aboutView.frame.size.width, 0, _aboutView.frame.size.width, _aboutView.frame.size.height);
        _aboutView.delegate=self;
    }
    return _aboutView;
}

#pragma mark - init

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.aboutView];

    [self.view addSubview:self.slideMenu];
    
    //按照touch的手势的顺序添加植物
    [self.boxContainer addObject:self.plant5];
    [self.boxContainer addObject:self.plant3];
    [self.boxContainer addObject:self.plant1];
    [self.boxContainer addObject:self.plant2];
    [self.boxContainer addObject:self.plant4];
    [self.boxContainer addObject:self.plant7];
    [self.boxContainer addObject:self.plant6];
    [self.boxContainer addObject:self.decorateSoil];
    [self.boxContainer addObject:self.cultureSoil];
    [self.boxContainer addObject:self.coarseSoil];
    self.slideMenu.sampleViewController=self;
    [self hideAllItem];
    
    [self performSelector:@selector(hideGuide) withObject:self afterDelay:5];
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void) hideAllItem
{
    for (UIImageView* obj in self.boxContainer)
    {
        obj.alpha=0;
    }
}

-(void) hideItem:(UIView*)item
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    item.alpha=0;
    [UIView commitAnimations];
}

-(void) showItem:(UIView*)item
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    item.alpha=1;
    [UIView commitAnimations];
}

#pragma mark - set coarse

-(void) setCoarseImageWithName:(NSString *)imageName
{
    [self.coarseSoil setImage:[UIImage imageNamed:imageName]];
    [self showItem:self.coarseSoil];
}

-(void) setCultureImageWithName:(NSString *)imageName
{
    [self.cultureSoil setImage:[UIImage imageNamed:imageName]];
    [self showItem:self.cultureSoil];
}

-(void) setDecorateImageWithName:(NSString *)imageName
{
    [self.decorateSoil setImage:[UIImage imageNamed:imageName]];
    [self showItem:self.decorateSoil];
}

#pragma mark - set plant

-(void) showPlantWithName:(NSString *)plantName
{
    if ([plantName isEqualToString:@"plant1"]) [self showItem:self.plant1];
    else if ([plantName isEqualToString:@"plant2"]) [self showItem:self.plant2];
    else if ([plantName isEqualToString:@"plant3"]) [self showItem:self.plant3];
    else if ([plantName isEqualToString:@"plant4"]) [self showItem:self.plant4];
    else if ([plantName isEqualToString:@"plant5"]) [self showItem:self.plant5];
    else if ([plantName isEqualToString:@"plant6"]) [self showItem:self.plant6];
    else if ([plantName isEqualToString:@"plant7"]) [self showItem:self.plant7];
}

#pragma mark - double touches for hiding plant or soil

-(BOOL) isTouchPoint:(CGPoint)touchPoint inView:(UIView*)view
{
    if (view.alpha==0) return NO;
    
    if (touchPoint.x>=view.frame.origin.x && touchPoint.x<=view.frame.size.width+view.frame.origin.x)
    {
        if (touchPoint.y>=view.frame.origin.y && touchPoint.y<=view.frame.size.height+view.frame.origin.y)
        {
            return YES;
        }
    }
    return NO;
}

- (IBAction)sampleTapGesture:(UITapGestureRecognizer *)sender
{
    CGPoint touchPoint=[sender locationInView:self.boxContainerView];
    NSLog(@"touchPoint %f %f",touchPoint.x,touchPoint.y);
    for (UIImageView* imageView in self.boxContainer)
    {
        if ([self isTouchPoint:touchPoint inView:imageView])
        {
            [self hideItem:imageView];
            break ;
        }
    }
}

-(void) hideGuide
{
    self.doubleClickGuide.hidden=YES;
}

-(void) showAbout
{
    self.slideMenu.userInteractionEnabled=NO;
    [self.aboutView show];
}

-(void) aboutLeaveDone
{
    self.slideMenu.userInteractionEnabled=YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
