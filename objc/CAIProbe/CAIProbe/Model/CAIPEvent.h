//
//  CAIPEvent.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPModel.h"
#import "CAIPKeyPath.h"
#import <Aspects/Aspects.h>

@interface CAIPEvent : CAIPModel

@property(nonatomic, assign)NSInteger type;
@property(nonatomic, strong, nullable)NSString * version;
@property(nonatomic, strong, nullable)NSString * ID;
@property(nonatomic, strong, nullable)NSString * classPath;
@property(nonatomic, strong, nullable)NSString * selector;
@property(nonatomic, strong, nullable)NSArray<CAIPKeyPath *> * keyPaths;

-(nullable NSDictionary *)handleInfo:(nullable id<AspectInfo>)info;

@end
