//
//  PMContext.h
//  Pods
//
//  Created by Bruno Bulić on 11/09/14.
//
//

#import <Foundation/Foundation.h>
#import "PMPracticFunction.h"

@interface PMContext : NSObject

- (instancetype)initWithContext:(id)context;
- (instancetype)initWithContext:(id)context1 andContext2:(id)context2;
- (instancetype)initWithContext:(id)context1 andContext2:(id)context2 andContext3:(id)context3;

@property (readonly) PMFunc (^asFunc1)(PMFunc1 weakArgument);
@property (readonly) PMFunc (^asFunc2)(PMFunc2 weakArgument);
@property (readonly) PMFunc (^asFunc3)(PMFunc3 weakArgument);

@end
