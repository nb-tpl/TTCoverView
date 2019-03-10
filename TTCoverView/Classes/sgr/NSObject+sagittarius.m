//
//  NSObject+sagittarius.m
//  sagittarius
//
//  Created by li hongdan on 12-12-2.
//  Copyright (c) 2012年 ifeng. All rights reserved.
//

#import "NSObject+sagittarius.h"

@implementation NSObject (sagittarius)
#pragma -
#pragma mark - 私有方法
-(BOOL)privateIsKindOfMutableArrayOrSet{
    if ([self isKindOfClass:[NSMutableArray class]] || [self isKindOfClass:[NSMutableOrderedSet class]] ||[self isKindOfClass:[NSMutableSet class]])
        return YES;
    return NO;
}
-(BOOL)privateIsKindOfArrayOrSet{
    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSOrderedSet class]] ||[self isKindOfClass:[NSSet class]])
        return YES;
    return NO;
}
-(NSUInteger)privateCount{
    if ([self isKindOfClass:[NSArray class]])
        return [(NSArray *)self count];
    else if ([self isKindOfClass:[NSOrderedSet class]])
        return [(NSOrderedSet *)self count];
    else if ([self isKindOfClass:[NSSet class]])
        return [(NSSet *)self count];
    return 0;
}
-(void)privateInsertObject:(id)anObject atIndex:(NSUInteger)index{
    if ([self isKindOfClass:[NSMutableArray class]])
        [(NSMutableArray *)self insertObject:anObject atIndex:index];
    else if ([self isKindOfClass:[NSMutableOrderedSet class]])
        [(NSMutableOrderedSet *)self insertObject:anObject atIndex:index];
}
-(void)privateAddObject:(id)anObject{
    if ([self isKindOfClass:[NSMutableArray class]])
        [(NSMutableArray *)self addObject:anObject];
    else if ([self isKindOfClass:[NSMutableOrderedSet class]])
        [(NSMutableOrderedSet *)self addObject:anObject];
    else if ([self isKindOfClass:[NSMutableSet class]])
        [(NSMutableSet *)self addObject:anObject];
}

-(void)privateRemoveObject:(id)anObject{
    if ([self isKindOfClass:[NSMutableArray class]])
        return [(NSMutableArray *)self removeObject:anObject];
    else if ([self isKindOfClass:[NSMutableOrderedSet class]])
        return [(NSMutableOrderedSet *)self removeObject:anObject];
    else if ([self isKindOfClass:[NSMutableSet class]])
        return [(NSMutableSet *)self removeObject:anObject];
}
-(void)privateRemoveLastObject{
    if ([self isKindOfClass:[NSMutableArray class]])
        return [(NSMutableArray *)self removeLastObject];
    else if ([self isKindOfClass:[NSMutableOrderedSet class]]&&[self privateCount]>0)
        return [(NSMutableOrderedSet *)self removeObjectAtIndex:[self privateCount]-1];
}

-(void)privateRemoveObjectAtIndex:(NSUInteger)index{
    if ([self isKindOfClass:[NSMutableArray class]])
        return [(NSMutableArray *)self removeObjectAtIndex:index];
    else if ([self isKindOfClass:[NSMutableOrderedSet class]])
        return [(NSMutableOrderedSet *)self removeObjectAtIndex:index];
}

-(id)privateObjectAtIndext:(NSUInteger)index{
    if ([self isKindOfClass:[NSArray class]])
        return [(NSArray *)self objectAtIndex:index];
    else if ([self isKindOfClass:[NSOrderedSet class]])
        return [(NSOrderedSet *)self objectAtIndex:index];
    return nil;
}
-(id)privateLastObject{
    if ([self isKindOfClass:[NSArray class]])
        return [(NSArray *)self lastObject];
    else if ([self isKindOfClass:[NSOrderedSet class]])
        return [(NSOrderedSet *)self lastObject];
    return nil;
}

#pragma -
#pragma mark -  公开方法
- (NSObject *)sgrObjectForKey:(NSString *)key;{
 // NSAssert([self isKindOfClass:[NSDictionary class]], @"sagittarius collect error:not a NSDictionary");
  if(key && self &&[self isKindOfClass:[NSDictionary class]]){
    
    return [(NSDictionary *)self objectForKey:key];
  }
  return nil;
}
- (id)sgrOrderSetObjectAtIndex:(NSInteger)index{
    if([self isKindOfClass:[NSOrderedSet class]] &&index< [((NSOrderedSet *)self) count] &&index>=0){
        return [((NSOrderedSet *)self) objectAtIndex:index];
    }
    return nil;
}
- (void)sgrInsertObject:(id)anObject atIndex:(NSUInteger)index{
    if(!anObject) return;
    if(self && [self privateIsKindOfMutableArrayOrSet]){
        if(index<[self privateCount]){
            [self privateInsertObject:anObject atIndex:index];
        }else{
            [self privateAddObject:anObject];
        }
    }
}

- (void)sgrSetObject:(NSObject *)obj forKey:(NSString *)key{
   NSAssert([self isKindOfClass:[NSMutableDictionary class]], @"sagittarius collect error:not a NSMutableDictionary");
  if(key && obj && self && [self respondsToSelector:@selector(setObject:forKey:)]){
    [(NSMutableDictionary *)self setObject:obj forKey:key];
  }
}

- (void)sgrRemoveForKey:(NSString *)key{
  NSAssert(([self isKindOfClass:[NSMutableDictionary class]] ||  [self isKindOfClass:[NSMutableArray class]]),
           @"sagittarius collect error:not a NSDictionary or a NSMutableArray");
  if(!(key && self) )return;
  if([self isKindOfClass:[NSMutableDictionary class]]){
    [(NSMutableDictionary *)self removeObjectForKey:key];
  }else if([self isKindOfClass:[NSMutableArray class]]){
    [(NSMutableArray *)self removeObject:key];
  }
}

- (void)sgrRemoveForIndex:(NSInteger)index{
    if(self && [self privateIsKindOfMutableArrayOrSet] &&
       index>=0 && index <[self privateCount]){
        [self privateRemoveObjectAtIndex:index];
    }
}


- (id)sgrGetType:(Class )clazz forIndex:(NSInteger)i{
  NSObject *obj=[self sgrGetForIndex:i];
  return obj&&[obj isKindOfClass:clazz]?obj:nil;
}

- (id)sgrGetType:(Class )clazz forKey:(NSString *)key{
  NSObject *obj=[self sgrObjectForKey:key];
  return obj&&[obj isKindOfClass:clazz]?obj:nil;
}
- (NSArray *)sgrGetArrayForKey:(NSString *)key{
  NSObject *obj=[self sgrObjectForKey:key];
  return (obj && [obj isKindOfClass:[NSArray class]])?(NSArray *)obj:nil;
}

- (NSMutableDictionary *)sgrGetMutDictionaryForKey:(NSString *)key{
    NSObject *obj=[self sgrObjectForKey:key];
    return (obj && [obj isKindOfClass:[NSMutableDictionary class]])?(NSMutableDictionary *)obj:nil;
    
}

- (NSDictionary *)sgrGetDictionaryForKey:(NSString *)key{
  NSObject *obj=[self sgrObjectForKey:key];
  return (obj && [obj isKindOfClass:[NSDictionary class]])?(NSDictionary *)obj:nil;
  
}

- (NSDictionary *)sgrGetDictionaryForIndex:(NSInteger)index{
  NSObject *obj=[self sgrGetForIndex:index];
  return (obj && [obj isKindOfClass:[NSDictionary class]])?(NSDictionary *)obj:nil;
}

- (NSArray *)sgrGetarrayForIndex:(NSInteger)index{
    NSObject *obj = [self sgrGetForIndex:index];
    return (obj && [obj isKindOfClass:[NSArray class]]?(NSArray *)obj:nil);
}

- (NSString *)sgrGetStringForKey:(NSString *)key defaultValue:(NSString *)value{
    NSObject *obj=[self sgrObjectForKey:key];
    return (obj && [obj isKindOfClass:[NSString class]])?(NSString *)obj:value;
}

- (NSString *)sgrFoceGetStringForKey:(NSString *)key defaultValue:(NSString *)value{
    NSObject *obj=[self sgrObjectForKey:key];
    if(!obj || [obj isKindOfClass:[NSNull class]]) return value;
    return ([obj isKindOfClass:[NSString class]])?(NSString *)obj:[obj description];
}

- (NSString *)sgrFGetStringforKey:(NSString *)key{
    NSObject *obj=[self sgrObjectForKey:key];
    if(!obj || [obj isKindOfClass:[NSNull class]]) return nil;
    return ([obj isKindOfClass:[NSString class]])?(NSString *)obj:[obj description];
}

- (NSString *)sgrGetStringForKey:(NSString *)key{
  NSObject *obj=[self sgrObjectForKey:key];
  return (obj && [obj isKindOfClass:[NSString class]])?(NSString *)obj:nil;
}

- (BOOL)sgrGetBoolForKey:(NSString *)key defaultValue:(BOOL)value{
    NSObject *obj=[self sgrObjectForKey:key];
    if (obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            if ([[(NSString *)obj lowercaseString] isEqualToString:@"ture"] ||
                [[(NSString *)obj lowercaseString] isEqualToString:@"yes"]  ||
                [[(NSString *)obj lowercaseString] isEqualToString:@"y"]    ) {
                return YES;
            }else if ([[(NSString *)obj lowercaseString] isEqualToString:@"false"] ||
                      [[(NSString *)obj lowercaseString] isEqualToString:@"no"]    ||
                      [[(NSString *)obj lowercaseString] isEqualToString:@"n"]     ){
                return NO;
            }
        }
        else{
            return CFBooleanGetValue((CFBooleanRef)obj);
        }
    }
    return value;
}


- (NSNumber *)sgrGetNumberForKey:(NSString *)key{
  NSObject *obj=[self sgrObjectForKey:key];
  return (obj && [obj isKindOfClass:[NSNumber class]])?(NSNumber *)obj:nil;
}

-(double)sgrGetDoubleForKey:(NSString *)key{
    NSObject *obj=[self sgrObjectForKey:key];
    if(obj && [obj isKindOfClass:[NSNumber class]]){
        return [(NSNumber *)obj doubleValue];
    }
    if(obj && [obj isKindOfClass:[NSString class]]){
        return [(NSString *)obj doubleValue];
    }
    return  MINDOUBLE;
}

-(float)sgrGetFloatForKey:(NSString *)key{
  NSObject *obj=[self sgrObjectForKey:key];
  if(obj && [obj isKindOfClass:[NSNumber class]]){
    return [(NSNumber *)obj floatValue];
  }
  if(obj && [obj isKindOfClass:[NSString class]]){
    return [(NSString *)obj floatValue];
  }
  return  MINFLOAT;
}

- (long long)sgrGetLongLongForKey:(NSString *)key{
    NSObject *obj=[self sgrObjectForKey:key];
    if(obj && [obj isKindOfClass:[NSNumber class]]){
        return [(NSNumber *)obj longLongValue];
    }
    if(obj && [obj isKindOfClass:[NSString class]]){
        return [(NSString *)obj longLongValue];
    }
    return MININT;
}

-(NSInteger)sgrGetIntegerForKey:(NSString *)key default:(NSInteger)defaultValue{
  NSObject *obj=[self sgrObjectForKey:key];
  if(obj && [obj isKindOfClass:[NSNumber class]]){
    return [(NSNumber *)obj integerValue];
  }
  if(obj && [obj isKindOfClass:[NSString class]]){
    return [(NSString *)obj integerValue];
  }
  return defaultValue;
}

-(CGFloat)sgrGetCGFloatForKey:(NSString*)key default:(CGFloat)defaultValue {
#if defined(CGFLOAT_IS_DOUBLE) && CGFLOAT_IS_DOUBLE
    #define _MSG_ doubleValue
#else
    #define _MSG_ floatValue
#endif
  NSObject *obj=[self sgrObjectForKey:key];
  if(obj && [obj isKindOfClass:[NSNumber class]]){
    return [(NSNumber *)obj _MSG_];
  }
  if(obj && [obj isKindOfClass:[NSString class]]){
    return [(NSString *)obj _MSG_];
  }
  return defaultValue;
}

-(NSInteger)sgrGetIntegerForKey:(NSString *)key{
  return [self sgrGetIntegerForKey:key default:MININT];
}

- (NSObject *)sgrGetForIndex:(NSInteger)index{
//  NSAssert([self isKindOfClass:[NSArray class]], @"sagittarius collect error:not a NSArray");
    if(self && [self privateIsKindOfArrayOrSet] &&
       index>=0 && index <[self privateCount]){
        return [self privateObjectAtIndext:index];
    }
    return nil;
}

- (NSNumber *)sgrGetNumberForIndex:(NSInteger)index{
    NSObject *obj=[self sgrGetForIndex:index];
    return (obj && [obj isKindOfClass:[NSNumber class]])?(NSNumber *)obj:nil;
}

- (id)sgrlastObjectOfType:(Class)clazz{
     if(self && [self privateIsKindOfArrayOrSet] && [self privateCount]>0) {
        NSObject *obj=[self privateLastObject];
        return (obj&&[obj isKindOfClass:clazz])?obj:nil;
    }else{
        return nil;
    }
}

- (void)sgrRemoveLastObject{
    if(self && [self privateIsKindOfMutableArrayOrSet] && [self privateCount]>0){
        [self privateRemoveLastObject];
    }
}

- (NSString *)sgrGetStringForIndex:(NSInteger)index{
  NSObject *obj=[self sgrGetForIndex:index];
  return (obj && [obj isKindOfClass:[NSString class]])?(NSString *)obj:nil;
}

- (void)sgrAddObject:(NSObject *)obj{
    NSAssert([self privateIsKindOfMutableArrayOrSet], @"sagittarius collect error:not a NSMutableArray");
    if(obj && self && [self privateIsKindOfMutableArrayOrSet]){
        [self privateAddObject:obj];
    }
}

- (void)sgrRemoveObject:(NSObject *)obj{
    NSAssert([self privateIsKindOfMutableArrayOrSet], @"sagittarius collect error:not a NSMutableArray");
    if(obj && self && [self privateIsKindOfMutableArrayOrSet]){
        [self privateRemoveObject:obj];
    }
}


@end
