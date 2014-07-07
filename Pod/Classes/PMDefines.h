//
//  PMDefines.h
//  Pods
//
//  Created by Bruno Bulić on 07/07/14.
//
//

#import <Foundation/Foundation.h>

typedef void(^PMFunc)       (void);
typedef void(^PMFunc1)      (id arg);
typedef void(^PMFunc2)      (id arg1, id arg2);
typedef void(^PMFunc3)      (id arg1, id arg2, id arg3);

typedef BOOL(^PMPredicate)  ();
typedef BOOL(^PMPredicate1) (id element);
typedef BOOL(^PMPredicate2) (id, id);

typedef id  (^PMMap1)       (id element);
typedef id  (^PMMap2)       (id element, id element2);
typedef id  (^PMIndexedMap1)(id element, NSUInteger index);
typedef id  (^PMIndexedMap2)(id element1, id element2, NSUInteger index);

