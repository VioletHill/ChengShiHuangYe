//
//  HomeViewPlant.m
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import "HomeViewPlantBuilder.h"

@implementation HomeViewPlantBuilder

+(NSMutableArray*) createInLayerView:(LayerView *)view
{
    NSMutableArray* plantArray=[[NSMutableArray alloc] init];
    
    ScutellariaIndica* si=[[ScutellariaIndica alloc] init];
    si.frame=CGRectMake(92, 100, si.frame.size.width, si.frame.size.height);
    [view addSubview:si];
    [plantArray addObject:si];
    
    DesmodiumCaudatum* dc=[[DesmodiumCaudatum alloc] init];
    dc.frame=CGRectMake(80, 260, dc.frame.size.width, dc.frame.size.height);
    [view addSubview:dc];
    [plantArray addObject:dc];
    
    LysimachiaChristinae* lc=[[LysimachiaChristinae alloc] init];
    lc.frame=CGRectMake(100, 380, lc.frame.size.width, lc.frame.size.height);
    [view addSubview:lc];
    [plantArray addObject:lc];
    
    MyurocladaMaxmowiczii* mm=[[MyurocladaMaxmowiczii alloc] init];
    mm.frame=CGRectMake(180, 560, mm.frame.size.width, mm.frame.size.height);
    [view addSubview:mm];
    [plantArray addObject:mm];
    
    CyperusCompressus* cc=[[CyperusCompressus alloc] init];
    cc.frame=CGRectMake(500, 60, cc.frame.size.width, cc.frame.size.height);
    [view addSubview:cc];
    [plantArray addObject:cc];
    
    AdiantumPedatum* ap=[[AdiantumPedatum alloc] init];
    ap.frame=CGRectMake(700, 170, ap.frame.size.width, ap.frame.size.height);
    [view addSubview:ap];
    [plantArray addObject:ap];
    
    Pachysandraterminalis* pr=[[Pachysandraterminalis alloc] init];
    pr.frame=CGRectMake(680, 480, pr.frame.size.width, pr.frame.size.height);
    [view addSubview:pr];
    [plantArray addObject:pr];
    
    RhaphiolepisIndica* ri=[[RhaphiolepisIndica alloc] init];
    ri.frame=CGRectMake(550, 580, ri.frame.size.width, ri.frame.size.height);
    [view addSubview:ri];
    [plantArray addObject:ri];
    
    return plantArray;
}

@end
