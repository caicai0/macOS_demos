//
//  CAIPKeyPathParser.h
//  CAIProbe
//
//  Created by 李玉峰 on 2019/11/21.
//  Copyright © 2019 liyufeng. All rights reserved.
//

#import "CAIPModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAIPKeyPathParser : CAIPModel

@property(nonatomic, assign)NSInteger type;
@property(nonatomic, assign)NSInteger index;
@property(nonatomic, strong)NSString * valueKeyPath;
@property(nonatomic, strong)NSString * className;
@property(nonatomic, strong)NSString * selector;

- (instancetype)initType:(NSInteger)type path:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
