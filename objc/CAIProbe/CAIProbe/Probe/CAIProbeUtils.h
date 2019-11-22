//
//  CAIProbeUtils.h
//  CAIProbe
//
//  Created by liyufeng on 2019/10/29.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAIProbeUtils : NSObject

+ (id _Nullable)objectForClass:(Class _Nullable)aclass selector:(SEL _Nullable)selector keyPath:(NSString *_Nullable)keyPath;
+ (id _Nullable)objectForInstance:(id _Nullable)instance keyPath:(NSString *_Nullable)keyPath;

@end
