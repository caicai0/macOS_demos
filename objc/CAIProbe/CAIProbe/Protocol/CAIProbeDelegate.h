//
//  CAIProbeDelegate.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/22.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAIPLog.h"

@protocol CAIProbeDelegate <NSObject>

- (void)onLog:(CAIPLog *)log;

@end

