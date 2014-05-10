//
//  ViewController.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"

@interface HomeViewController ()<ControllerDelegate>

@property (strong,nonatomic) LayerView* layerView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.layerView=[[HomeView alloc] init];
    [self.view addSubview:self.layerView];
    self.layerView.controllerDelegate=self;
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.layerView enterLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) gotoNextController
{
    UIViewController* sampleViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"sampleViewController"];
    NSLog(@"%@",sampleViewController);
    [self.layerView leaveLayer];
    [self presentViewController:sampleViewController animated:YES completion:nil];
}

@end
