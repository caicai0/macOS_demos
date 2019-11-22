//
//  CAIPAOPManager.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/22.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Aspects/Aspects.h>

@protocol CAIPAOPManagerDelegate <NSObject>

- (void)afterInvocationWithInfo:(id<AspectInfo>)info userInfo:(id)userInfo;

@end

@interface CAIPAOPManager : NSObject

@property(nonatomic, strong)NSMutableArray<id<AspectToken>>* tokens;
@property(nonatomic, weak)id<CAIPAOPManagerDelegate> delegate;

+ (instancetype)defaultManager;

- (void)removeAllTokens;
- (void)addAopWithClass:(NSString *)clsName sel:(NSString *)selName userInfo:(id)userInfo;

@end
