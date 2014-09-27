//
//  PMOptional.m
//  Pods
//
//  Created by Bruno Bulić on 27/09/14.
//
//

#import "PMOptional.h"

@interface PMOptional ()

- (instancetype)initWithObject:(id)obj;

@end

@implementation PMOptional

- (instancetype)initWithObject:(id)obj {
    self = [super init];
    if (self) {
        _object = obj;
    }
    return self;
}

- (BOOL)checkObject {
    return _object != nil;
}

- (id (^)(PMMap0 map))objectOrDefault {
    return ^id (PMMap0 arg) {
        return arg();
    };
}

+ (instancetype)wrap:(id)object {
    if (object) {
        return [PMSome some:object];
    } else {
        return [PMNone none];
    }
}

@end

@implementation PMSome

+ (instancetype)some:(id)obj {
    return [[self alloc] initWithObject:obj];
}

@end

@implementation PMNone

+ (instancetype)none {
    static dispatch_once_t onceToken;
    static PMNone * _none;
    dispatch_once(&onceToken, ^{
        _none = [[PMNone alloc] initWithObject:nil];
    });
    
    return _none;
}

@end