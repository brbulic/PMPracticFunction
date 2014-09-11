//
//  PMContext.m
//  Pods
//
//  Created by Bruno Bulić on 11/09/14.
//
//

#import "PMContext.h"

@implementation PMContext {
    __weak id _context1;
    __weak id _context2;
    __weak id _context3;
}

- (instancetype)initWithContext:(id)context {
    self = [super init];
    if (self) {
        _context1 = context;
    }
    
    return self;
}

- (instancetype)initWithContext:(id)context1 andContext2:(id)context2
{
    self = [super init];
    if (self) {
        _context1 = context1;
        _context2 = context2;
    }
    return self;
}

- (instancetype)initWithContext:(id)context1 andContext2:(id)context2 andContext3:(id)context3
{
    self = [super init];
    if (self) {
        _context1 = context1;
        _context2 = context2;
        _context3 = context3;
    }
    return self;
}

- (PMFunc (^)(PMFunc1))asFunc1 {
    return ^PMFunc (PMFunc1 argument) {
        NSParameterAssert(argument);
        return ^(void) {
            argument(_context1);
        };
    };
}

- (PMFunc (^)(PMFunc2))asFunc2 {
    return ^PMFunc (PMFunc2 argument) {
        NSParameterAssert(argument);
        return ^(void) {
            argument(_context1, _context2);
        };
    };
}

- (PMFunc (^)(PMFunc3))asFunc3 {
    return ^PMFunc (PMFunc3 argument) {
        NSParameterAssert(argument);
        return ^(void) {
            argument(_context1, _context2, _context3);
        };
    };
}

@end