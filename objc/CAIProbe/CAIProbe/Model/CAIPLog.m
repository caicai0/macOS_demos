//
//  CAIPLog.m
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPLog.h"

@implementation CAIPLog

- (instancetype)initWithEvent:(CAIPEvent *)event res:(NSDictionary *)res
{
    self = [super init];
    if (self) {
        self.event = event;
        self.res = res;
    }
    return self;
}

@end
