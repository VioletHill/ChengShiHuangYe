//
//  HomeViewPlant.h
//  ChengShiHuangYe-iPad
//
//  Created by 邱峰 on 5/1/14.
//  Copyright (c) 2014 TongjiUniversity. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PlantInfo.h"
#import "ScutellariaIndica.h"
#import "DesmodiumCaudatum.h"
#import "LysimachiaChristinae.h"
#import "MyurocladaMaxmowiczii.h"
#import "CyperusCompressus.h"
#import "AdiantumPedatum.h"
#import "Pachysandraterminalis.h"
#import "RhaphiolepisIndica.h"
#import "LayerView.h"

@interface HomeViewPlantBuilder : NSObject

+(NSMutableArray*) createInLayerView:(LayerView*)view;

@end
