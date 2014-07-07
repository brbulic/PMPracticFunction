//
//  NSArray+RandomMethods.h
//  BadIcons
//
//  Created by Luka Boban on 31/10/13.
//  Copyright (c) 2013 HolosOne. All rights reserved.
//

#import "PMDefines.h"

@interface NSArray (BlockExtensions)

/**
 *  Just a forEach simple.
 *
 *  @param forEach the foreaching method.
 */
- (void)forEach:(PMFunc1)forEach;

/**
 *  Creates a new array by applying a transformation function to every element of the array
 *
 *  @param map Mapping function
 *
 *  @return Converted array
 */
- (NSArray *)map:(PMMap1)map;

/**
 *  Creates a new array by applying a transformation function but with an item index as argument.
 *
 *  @param map Mapping function
 *
 *  @return Converted array
 */
- (NSArray *)mapIndex:(PMIndexedMap1)map;

/**
 *  Creates a new array by filtering elements that satisfy a filter function.
 *
 *  @param predicate Logical
 *
 *  @return A filtered array
 */
- (NSArray *)filter:(PMPredicate1)predicate;

/**
 *  Take the n first elements from the array returning them in an array. If count(array) = m, m < n, returns the first m elements
 *
 *  @param first Element count to take
 *
 *  @return The first n elements, or m of count(array) = m, m < n
 */
- (NSArray *)takeFirst:(NSUInteger)first;

/**
 *  Take the n last elements from the array returning them in an array. If count(array) = m, m < n, returns the last m elements
 *
 *  @param first Element count to take
 *
 *  @return The last n elements, or m of count(array) = m, m < n
 */
- (NSArray *)takeLast:(NSUInteger)first;

/**
 *  Sequentially find the first element satisfying the condition
 *
 *  @param predicate The condition tester method
 *
 *  @return The filtered element
 */
- (id)find:(PMPredicate1)predicate;

/**
 *  Fold the array using a folding function with the accumulator as the start.
 *
 *  @param accumulator the start value
 *  @param map         transformation function
 *
 *  @return A scalar value with all the accumulated results
 */
- (id)foldLeft:(id)accumulator withConverter:(PMMap2)map;

- (BOOL)allSatisfies:(PMPredicate1)predicate;
- (BOOL)oneSatisfies:(PMPredicate1)predicate;

- (NSArray *)groupByKey:(PMMap1)keyForItemBlock;
- (NSArray *)groupByKey:(PMMap1)keyForItemBlock withCustomComparator:(PMPredicate2)comparator;

@end

@interface NSArray (RandomMethods)

-(id)randomObject;

@end