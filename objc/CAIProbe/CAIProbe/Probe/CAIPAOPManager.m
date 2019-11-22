//
//  CAIPAOPManager.m
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/22.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPAOPManager.h"

@implementation CAIPAOPManager

+ (instancetype)defaultManager{
    static CAIPAOPManager * defautManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defautManager = [[CAIPAOPManager alloc]init];
    });
    return defautManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tokens = [NSMutableArray array];
    }
    return self;
}

- (void)removeAllTokens{
    for (id<AspectToken> token in self.tokens) {
        [token remove];
    }
    [self.tokens removeAllObjects];
}

- (void)addAopWithClass:(NSString *)clsName sel:(NSString *)selName userInfo:(id)userInfo {
    Class aclass = NSClassFromString(clsName);
    SEL selector = NSSelectorFromString(selName);
    if (aclass && selector) {
        @try {
            NSError * error = nil;
            id<AspectToken> token = [aclass aspect_hookSelector:selector
                                                    withOptions:AspectPositionAfter
             usingBlock:^(id<AspectInfo> info) {
                 [self afterInvocationInfo:info userInfo:userInfo];
             } error:&error];
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tokens addObject:token];
            }
        } @catch (NSException *exception) {
            
        }
    }
}

- (void)afterInvocationInfo:(id<AspectInfo>)info userInfo:(id)userInfo{
    if (self.delegate) {
        [self.delegate afterInvocationWithInfo:info userInfo:userInfo];
    }
}

@end
