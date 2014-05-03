//
//  ViewController.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "ViewController.h"
#import "HomeView.h"

@interface ViewController ()

@property (strong,nonatomic) LayerView* layerView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.layerView=[[HomeView alloc] init];
    [self.view addSubview:self.layerView];
    [self.layerView enterLayer];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
