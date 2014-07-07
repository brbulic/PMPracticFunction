//
//  NSArray+BlockExtensions.h
//  BadIcons
//
//  Created by Bruno Bulić on 31/10/13.
//  Copyright (c) 2013 Pinjamar doo All rights reserved.
//

#import "NSArray+BlockExtensions.h"
#import "Tuple2.h"

@implementation NSArray (RandomMethods)

-(id)randomObject {
    if (self.count == 0) return nil;
    return [self objectAtIndex:arc4random_uniform(self.count)];
}

@end

@implementation NSArray (BlockExtensions)

- (void)forEach:(PMFunc1)forEach {
    NSAssert(forEach != nil, @"Block must exist");
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        forEach(obj);
    }];
}

- (NSArray *)map:(PMMap1)map {
    NSAssert(map != nil, @"Block must exist");
    
    return [self mapIndex:^id(id element, NSUInteger index) {
        return map(element);
    }];
}

- (NSArray *)mapIndex:(PMIndexedMap1)map {
    NSAssert(map != nil, @"Block must exist");
    
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsWithOptions:0 usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id tempUnit = map(obj, idx);
        if (tempUnit != nil) {
            [array addObject:tempUnit];
        } else {
            [array addObject:[NSNull null]];
        }
    }];
    
    return [NSArray arrayWithArray:array];
}

- (NSArray *)filter:(PMPredicate1)predicate {
    NSAssert(predicate != nil, @"Block must exist");
    
    NSMutableArray * array = [NSMutableArray array];
    [self enumerateObjectsWithOptions:0 usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (predicate(obj)) {
            [array addObject:obj];
        }
    }];
    
    return [NSArray arrayWithArray:array];
}

- (NSArray *)takeFirst:(NSUInteger)first {
    if (first == 0) {
        return @[];
    }
    
    NSAssert(first > 0, @"Ugh impossible");
    
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:first];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx < first) {
            [arr addObject:obj];
        } else {
            *stop = YES;
        }
    }];
    
    return [NSArray arrayWithArray:arr];
}

- (NSArray *)takeLast:(NSUInteger)first {
    if (!first) {
        return @[];
    }
    
    NSAssert(first > 0, @"Ugh impossible");
    
    NSMutableArray * result = [NSMutableArray arrayWithCapacity:first];
    
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx < first) {
            [result addObject:obj];
        } else {
            *stop = YES;
        }
    }];
    
    return [[[NSArray arrayWithArray:result] reverseObjectEnumerator] allObjects];
}


- (id)find:(PMPredicate1)predicate {
    NSAssert(predicate != nil, @"Block must exist");
    
    __block id unit = nil;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BOOL isFound = predicate(obj);
        if (isFound) {
            unit = obj;
            *stop = YES;
        }
    }];
    
    return unit;
}

- (id)foldLeft:(id)accumulator withConverter:(PMMap2)map {
    NSAssert(accumulator != nil, @"Result must not be nil.");
    NSAssert(map, @"Mapping function must exist here");
    
    __block id result = accumulator;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id resultCandidate = map(result, obj);
        NSAssert(resultCandidate != nil, @"Result must not be nil.");
        result = resultCandidate;
    }];
    
    return result;
}

- (BOOL)allSatisfies:(PMPredicate1)predicate {
    NSAssert(predicate != nil, @"Block must exist");
    
    __block BOOL allSatisfies = YES;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        allSatisfies = allSatisfies & predicate(obj);
        if (!allSatisfies) {
            *stop = YES;
        }
    }];
    
    return allSatisfies;
}

- (BOOL)oneSatisfies:(PMPredicate1)predicate {
    NSAssert(predicate != nil, @"Block must exist");
    
    return [self find:predicate] != nil;
}

- (NSArray *)groupByKey:(PMMap1)keyForItemBlock {
    NSAssert(keyForItemBlock, @"Key Item fetcher must exist!");
    
    return [self groupByKey:keyForItemBlock withCustomComparator:^BOOL(id a, id b) {
        return [a isEqual:b];
    }];
}

- (NSArray *)groupByKey:(PMMap1)keyForItemBlock withCustomComparator:(PMPredicate2)comparator {
    NSAssert(keyForItemBlock, @"Key Item fetcher must exist!");
    NSAssert(comparator, @"Comparator must exist!");
    
    NSMutableArray * arr = [NSMutableArray array];
    
    for (id element in self) {
        Tuple2 * groupBucket = nil;
        id groupKey = keyForItemBlock(element);
        
        for (Tuple2 * bucketCandidate in arr) {
            if (comparator(groupKey, bucketCandidate.T1)) {
                groupBucket = bucketCandidate;
                break;
            }
        }
        
        if (!groupBucket) {
            groupBucket = [Tuple2 new];
            groupBucket.T1 = groupKey;
            groupBucket.T2 = [NSArray array];
            [arr addObject:groupBucket];
        }
        
        groupBucket.T2 = [groupBucket.T2 arrayByAddingObject:element];
    }
    
    return arr;
}

@end

