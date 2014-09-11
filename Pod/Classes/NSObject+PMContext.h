//
//  NSObject+PMContext.h
//  MLG.tv
//
//  Created by Bruno Bulić on 28/08/14.
//  Copyright (c) 2014 Bruno Bulić. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMDefines.h"

@class PMContext;

@interface NSObject (PMContext)

- (PMContext *)wrapObject;

@end

@interface NSArray (PMContext)

/**
 *  Wrap an array of non-null objects in an object as weak references.
 *
 *  @return return the PMContext object to create context sensitive methods
 */
- (PMContext *)wrapObjects;

@end

