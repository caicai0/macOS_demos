//
//  CAIPPlan.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPModel.h"
#import "CAIPEvent.h"

@interface CAIPPlan : CAIPModel

@property(nonatomic, strong)NSString * version;
@property(nonatomic, assign)NSTimeInterval onceEventDelayTime;
@property(nonatomic, strong)NSArray<CAIPEvent *> * events;

@end

