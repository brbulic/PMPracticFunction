//
//  NSArray+BlockExtensions.h
//  BadIcons
//
//  Created by Bruno Bulić on 31/10/13.
//  Copyright (c) 2013 Pinjamar doo All rights reserved.
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

/**
 *  Returns weather all elements satisfy a certain condition
 *
 *  @param predicate The Condition Tester
 *
 *  @return YES if all values satisfy a condition, otherwise NO
 */
- (BOOL)allSatisfies:(PMPredicate1)predicate;

/**
 *  Returns a boolean weather a single element satisfies a value.
 *
 *  @param predicate The Condition Tester
 *
 *  @return YES if at least one element satisfies a condition, otherwise NO
 */
- (BOOL)oneSatisfies:(PMPredicate1)predicate;

/**
 *  Creates an array of Tuple2<id,NSArray> elements grouped by a condition with a default key comparer.
 *
 *  @param keyForItemBlock How to extract a key from elements.
 *
 *  @return The grouped array
 */
- (NSArray *)groupByKey:(PMMap1)keyForItemBlock;

/**
 *  Creates an array of Tuple2<id,NSArray> elements grouped by a condition with a custom key comparer.
 *
 *  @param keyForItemBlock How to extract a key from elements.
 *  @param comparator      The custom comparer.
 *
 *  @return The grouped array.
 */
- (NSArray *)groupByKey:(PMMap1)keyForItemBlock withCustomComparator:(PMPredicate2)comparator;

@end

@interface NSArray (RandomMethods)

-(id)randomObject;

@end