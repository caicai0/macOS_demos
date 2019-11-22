//
//  CAIPKeyPath.m
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPKeyPath.h"
#import <Aspects/Aspects.h>
#import "CAIProbeUtils.h"

@implementation CAIPKeyPath

- (CAIPKeyPathParser *)parser{
    if (!_parser) {
        _parser = [[CAIPKeyPathParser alloc]initType:self.type path:self.keyPath];
    }
    return _parser;
}

- (nullable NSString *)valueInfo:(id<AspectInfo>)info{
    if (info) {
        if (self.parser.index >= 0) {
            id object = nil;
            if (self.parser.index == 0) {
                object = info.instance;
            }else if(self.parser.index > 0){
                if (self.parser.index -1 < info.arguments.count) {
                    object = info.arguments[self.parser.index -1];
                }
            }
            
            if (object) {
                if (self.parser.valueKeyPath) {
                    NSString * value = [object valueForKey:self.parser.valueKeyPath];
                    return value.description;
                }else{
                    if ([object respondsToSelector:@selector(description)]) {
                        return [object description];
                    }else{
                        return @"null";
                    }
                }
            }
        }
    }else{
        NSString * className = self.parser.className;
        NSString * selector = self.parser.selector;
        Class cls = NSClassFromString(className);
        if (className && selector && cls) {
            SEL sel = NSSelectorFromString(selector);
            id object = [CAIProbeUtils objectForClass:cls selector:sel keyPath:self.parser.valueKeyPath];
            if (object && [object respondsToSelector:@selector(description)]) {
                return [object description];
            }
        }
    }
    return nil;
}

@end
