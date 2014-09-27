//
//  PMOptional.h
//  Pods
//
//  Created by Bruno Bulić on 27/09/14.
//
//

#import "PMDefines.h"

@class PMOptional;

@interface PMOptional : NSObject

@property (readonly, getter=checkObject) BOOL hasObject;
@property (readonly) id object;
@property (readonly) id (^objectOrDefault)(PMMap0 resultFunc);

+ (instancetype)wrap:(id)object;

@end


@interface PMSome : PMOptional

+ (instancetype)some:(id)obj;

@end

@interface PMNone : PMOptional

+(instancetype)none;

@end
