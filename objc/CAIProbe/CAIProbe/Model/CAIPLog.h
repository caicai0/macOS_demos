//
//  CAIPLog.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPModel.h"
#import "CAIPEvent.h"

@interface CAIPLog : CAIPModel

@property(nonatomic, strong)CAIPEvent * event;
@property(nonatomic, strong)NSDictionary * res;

- (instancetype)initWithEvent:(CAIPEvent *)event res:(NSDictionary *)res;

@end
