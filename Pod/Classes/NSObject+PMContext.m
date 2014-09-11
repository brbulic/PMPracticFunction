//
//  NSObject+PMContext.m
//  MLG.tv
//
//  Created by Bruno Bulić on 28/08/14.
//  Copyright (c) 2014 Bruno Bulić. All rights reserved.
//

#import "NSObject+PMContext.h"
#import "PMContext.h"

@implementation NSObject (PMContext)

- (PMContext *)wrapObject {
    return [[PMContext alloc] initWithContext:self];
}

@end

@implementation NSArray (PMContext)

- (PMContext *)wrapObjects {
    if (self.count == 1) {
        return [[self firstObject] wrapObject];
    }
    
    if (self.count == 2) {
        return [[PMContext alloc] initWithContext:self[0] andContext2:self[1]];
    }
    
    if (self.count == 3) {
        return [[PMContext alloc] initWithContext:self[0] andContext2:self[1] andContext3:self[2]];
    }
    
    @throw [NSException exceptionWithName:NSRangeException reason:@"Cannot have more then 3 or less then 1 item for context" userInfo:nil];
    
    return nil;
}

@end
