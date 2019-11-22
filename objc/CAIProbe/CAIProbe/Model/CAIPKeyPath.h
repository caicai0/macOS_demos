//
//  CAIPKeyPath.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPModel.h"
#import "CAIPKeyPathParser.h"
#import <Aspects/Aspects.h>

@interface CAIPKeyPath : CAIPModel

@property(nonatomic, assign)NSInteger type;
@property(nonatomic, strong, nullable)NSString * version;
@property(nonatomic, strong, nullable)NSString * ID;
@property(nonatomic, strong, nullable)NSString * keyPath;
@property(nonatomic, strong, nullable)CAIPKeyPathParser * parser;

-(nullable NSString *)valueInfo:(nullable id<AspectInfo>)info;

@end
