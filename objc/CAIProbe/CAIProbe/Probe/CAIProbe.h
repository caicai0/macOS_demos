//
//  CAIProbe.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/22.
//  Copyright © 2019 李玉峰. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for CAIProbe.
FOUNDATION_EXPORT double CAIProbeVersionNumber;

//! Project version string for CAIProbe.
FOUNDATION_EXPORT const unsigned char CAIProbeVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <CAIProbe/PublicHeader.h>

#import "CAIPPlan.h"
#import "CAIProbeDelegate.h"

@interface CAIProbe : NSObject

@property(nonatomic, assign)double onceTime;
@property(nonatomic, strong)CAIPPlan * plan;
@property(nonatomic, weak)id<CAIProbeDelegate> delegate;

+ (instancetype)defaultProbe;

- (void)loadPlanJson:(NSString *)json;

@end
