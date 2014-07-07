//
//  Tuple2.h
//  SmashIcons
//
//  Created by Bruno Bulić on 22/06/14.
//  Copyright (c) 2014 HolosOne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tuple2 : NSObject

@property (nonatomic, strong) id T1;
@property (nonatomic, strong) id T2;

- (instancetype)initWithT1:(id)t1 andT2:(id)t2;

@end
