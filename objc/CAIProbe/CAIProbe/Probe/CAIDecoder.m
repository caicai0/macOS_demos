//
//  CAIDecoder.m
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/22.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIDecoder.h"

@implementation CAIDecoder

+ (id)decodeClass:(Class)cls from:(NSDictionary *)dic typeMap:(NSDictionary *)map{
    if (dic) {
        id res = [[cls alloc]init];
        @try {
            for (NSString * key in dic.allKeys) {
                id value = dic[key];
                if ([value isKindOfClass:[NSArray class]]) {
                    NSArray * arr = (NSArray*)value;
                    NSString * className = NSStringFromClass(cls);
                    NSString * propertyName = [NSString stringWithFormat:@"%@.%@",className,key];
                    NSString * typeName = map[propertyName];
                    if (typeName) {
                        Class typeCls = NSClassFromString(typeName);
                        if (typeCls) {
                            NSMutableArray * arrValue = [NSMutableArray array];
                            for (NSInteger i=0; i < arr.count; i++) {
                                NSDictionary * subDic = arr[i];
                                id object = [CAIDecoder decodeClass:typeCls from:subDic typeMap:map];
                                if (object) {
                                    [arrValue addObject:object];
                                }
                            }
                            [self object:res setValue:arrValue forKey:key];
                        }
                    }
                }else if([value isKindOfClass:[NSDictionary class]]){
                    NSDictionary * subDic = (NSDictionary *)value;
                    NSString * propertyName = [NSString stringWithFormat:@"%@.%@",cls,key];
                    NSString * typeName = map[propertyName];
                    if (typeName) {
                        Class typeCls = NSClassFromString(typeName);
                        if (typeCls) {
                            id object = [CAIDecoder decodeClass:typeCls from:subDic typeMap:map];
                            if (object) {
                                [self object:res setValue:object forKey:key];
                            }
                        }
                    }
                }else{
                    [self object:res setValue:value forKey:key];
                }
            }
        } @catch (NSException *exception) {
            
        }
        return res;
    }
    return nil;
}

#pragma mark - private

+ (NSException *)object:(id)object setValue:(id)value forKey:(NSString *)key{
    @try {
        [object setValue:value forKey:key];
    } @catch (NSException *exception) {
        return exception;
    }
    return nil;
}

static NSDictionary * defaultMap;
+ (void)setDefaultMap:(NSDictionary *)map{
    defaultMap = map;
}

+ (id)decodeClass:(Class)cls from:(NSDictionary *)dic{
    return [self decodeClass:cls from:dic typeMap:defaultMap];
}

@end
