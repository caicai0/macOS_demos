//
//  Event.m
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPEvent.h"
#import <Aspects/Aspects.h>

@implementation CAIPEvent

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = 0;
        self.version = @"";
        self.ID = @"";
        self.classPath = @"";
        self.selector = @"";
        self.keyPaths = [NSArray array];
    }
    return self;
}

-(nullable NSDictionary *)handleInfo:(id<AspectInfo>)info{
    NSMutableDictionary * res = [NSMutableDictionary dictionary];
    for (NSInteger i=0; i < self.keyPaths.count; i++) {
        CAIPKeyPath * keyPath = self.keyPaths[i];
        if (keyPath && [keyPath isKindOfClass:[CAIPKeyPath class]]) {
            id value = [keyPath valueInfo:info];
            if (value && keyPath.ID) {
                res[keyPath.ID] = value;
            }
        }
    }
    if (res.count) {
        return res;
    }else{
        return nil;
    }
}

@end
