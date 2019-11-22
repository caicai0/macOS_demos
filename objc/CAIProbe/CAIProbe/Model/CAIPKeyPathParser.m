//
//  CAIPKeyPathParser.m
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPKeyPathParser.h"

@implementation CAIPKeyPathParser

- (instancetype)initType:(NSInteger)type path:(NSString *)path
{
    self = [super init];
    if (self) {
        self.type = type;
        NSArray * arr = [path componentsSeparatedByString:@"."];
        if (type == 0) {
            if (arr.count > 0) {
                NSString * first = arr.firstObject;
                if ([first respondsToSelector:@selector(intValue)]) {
                    self.index = [first intValue];
                    if (arr.count > 1) {
                        NSMutableArray * marr = [NSMutableArray arrayWithArray:arr];
                        [marr removeObjectAtIndex:0];
                        self.valueKeyPath = [marr componentsJoinedByString:@"."];
                    }
                }
            }
        }else if(type == 1) {
            if (arr.count > 1) {
                NSString * first = arr[0];
                NSString * second = arr[1];
                if (first.length && second.length) {
                    self.className = first;
                    self.selector = second;
                    if (arr.count > 2) {
                        NSMutableArray * marr = [NSMutableArray arrayWithArray:arr];
                        [marr removeObjectAtIndex:0];
                        [marr removeObjectAtIndex:0];
                        self.valueKeyPath = [marr componentsJoinedByString:@"."];
                    }
                }
            }
        }
    }
    return self;
}

@end
