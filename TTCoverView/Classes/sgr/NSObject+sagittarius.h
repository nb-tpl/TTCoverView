//
//  NSObject+sagittarius.h
//  sagittarius
//
//  Created by li hongdan on 12-12-2.
//  Copyright (c) 2012年 ifeng. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#define MINFLOAT (-MAXFLOAT)
#define MININT (0x80000000)
#define MINDOUBLE (-MAXFLOAT)
@interface NSObject (sagittarius)

- (void)sgrInsertObject:(id)anObject atIndex:(NSUInteger)index;

- (NSObject *)sgrObjectForKey:(NSString *)key;

- (id)sgrOrderSetObjectAtIndex:(NSInteger)index;

- (void)sgrSetObject:(NSObject *)obj forKey:(NSString *)key;

- (NSString *)sgrGetStringForKey:(NSString *)key;

- (BOOL)sgrGetBoolForKey:(NSString *)key defaultValue:(BOOL)value;

- (NSNumber *)sgrGetNumberForKey:(NSString *)key;

- (void)sgrRemoveForKey:(NSString *)key;

- (NSObject *)sgrGetForIndex:(NSInteger)index;

- (void)sgrAddObject:(NSObject *)obj;
- (void)sgrRemoveObject:(NSObject *)obj;

- (NSString *)sgrGetStringForIndex:(NSInteger)index;

- (NSArray *)sgrGetArrayForKey:(NSString *)key;

- (NSNumber *)sgrGetNumberForIndex:(NSInteger)index;

- (NSArray *)sgrGetarrayForIndex:(NSInteger)index;

- (NSDictionary *)sgrGetDictionaryForKey:(NSString *)key;

- (NSMutableDictionary *)sgrGetMutDictionaryForKey:(NSString *)key;

- (NSDictionary *)sgrGetDictionaryForIndex:(NSInteger)index;

- (long long)sgrGetLongLongForKey:(NSString *)key;

-(NSInteger)sgrGetIntegerForKey:(NSString *)key;
-(NSInteger)sgrGetIntegerForKey:(NSString *)key default:(NSInteger)defaultValue;
-(CGFloat)sgrGetCGFloatForKey:(NSString*)key default:(CGFloat)defaultValue;

-(float)sgrGetFloatForKey:(NSString *)key;

-(double)sgrGetDoubleForKey:(NSString *)key;

- (id)sgrGetType:(Class )clazz forIndex:(NSInteger)i;

- (id)sgrGetType:(Class )clazz forKey:(NSString *)key;

- (id)sgrlastObjectOfType:(Class)clazz;

- (void)sgrRemoveForIndex:(NSInteger)index;

- (void)sgrRemoveLastObject;

- (NSString *)sgrFGetStringforKey:(NSString *)key;

- (NSString *)sgrGetStringForKey:(NSString *)key defaultValue:(NSString *)value;

- (NSString *)sgrFoceGetStringForKey:(NSString *)key defaultValue:(NSString *)value;
@end
