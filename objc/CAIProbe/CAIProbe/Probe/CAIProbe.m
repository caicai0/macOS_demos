//
//  CAIProbe.m
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIProbe.h"
#import "CAIDecoder.h"
#import "CAIPPlan.h"
#import "CAIPAOPManager.h"

@interface CAIProbe()<CAIPAOPManagerDelegate>

@end

@implementation CAIProbe

+ (instancetype)defaultProbe{
    static CAIProbe * probe;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        probe = [[CAIProbe alloc]init];
    });
    return probe;
}

- (void)loadPlanJson:(NSString *)json{
    @try {
        NSData * data = [json dataUsingEncoding: kCFStringEncodingUTF8];
        NSError * error = nil;
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        
        NSDictionary * map = @{@"CAIPPlan.events":@"CAIPEvent",
                               @"CAIPEvent.keyPaths":@"CAIPKeyPath",
                               @"CAIPKeyPath.parser":@"CAIPKeyPathParser"
        };
        [CAIDecoder setDefaultMap:map];
        self.plan = [CAIDecoder decodeClass:[CAIPPlan class] from:dic];
        [self analysisAllEvents];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}

- (void)analysisAllEvents{
    CAIPAOPManager.defaultManager.delegate = self;
    [CAIPAOPManager.defaultManager removeAllTokens];
    for (CAIPEvent * event in self.plan.events) {
        if (event.type == 0) {
            
        }else if(event.type == 1 || event.type == 2) {
            [CAIPAOPManager.defaultManager addAopWithClass:event.classPath sel:event.selector userInfo:event];
        }
    }
}

#pragma mark - private

- (void)afterInvocationWithInfo:(id<AspectInfo>)info userInfo:(id)userInfo{
    if (self.delegate) {
        CAIPEvent * event = userInfo;
        if ([event isKindOfClass:[CAIPEvent class]]) {
            CAIPLog * log = [[CAIPLog alloc]initWithEvent:event res:[event handleInfo:info]];
            [self.delegate onLog:log];
        }
    }
}

@end
