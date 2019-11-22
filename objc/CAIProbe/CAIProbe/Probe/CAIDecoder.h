//
//  CAIDecoder.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/22.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAIDecoder : NSObject

+ (id)decodeClass:(Class)cls from:(NSDictionary *)dic typeMap:(NSDictionary *)map;

+ (void)setDefaultMap:(NSDictionary *)map;
+ (id)decodeClass:(Class)cls from:(NSDictionary *)dic;

@end

