//
//  Tuple2.m
//  SmashIcons
//
//  Created by Bruno Bulić on 22/06/14.
//  Copyright (c) 2014 HolosOne. All rights reserved.
//

#import "Tuple2.h"

@implementation Tuple2

- (NSString *)description {
    NSString * hash = [super description];
    return  [hash stringByAppendingFormat:@"\n\t=> T1: %@\n\t=> T2: %@", [self.T1 description], [self.T2 description]];
}

- (instancetype)initWithT1:(id)t1 andT2:(id)t2
{
    self = [super init];
    if (self) {
        self.T1 = t1;
        self.T2 = t2;
    }
    return self;
}

@end