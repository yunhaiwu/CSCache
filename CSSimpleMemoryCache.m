//
//  CSSimpleMemoryCache.m
//  CocoaService-Framework
//
//  Created by 吴云海
//  Copyright © 2018年 yunhai.wu. All rights reserved.
//

#import "CSSimpleMemoryCache.h"
#import "CSSafeDictionary.h"
#import "CSAnnotation.h"

CSCacheServiceId const CSCacheServiceIdMemorySafe = @"CacheServiceIdMemorySafe";

@interface CSSimpleMemoryCache ()

@property (nonatomic, strong) CSSafeDictionary *data;

@end

@CSService(CSCache, CSSimpleMemoryCache)
@implementation CSSimpleMemoryCache

+ (BOOL)hasSingleton {
    return YES;
}

+ (NSString *)uniqueId {
    return CSCacheServiceIdMemorySafe;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _data = [CSSafeDictionary new];
    }
    return self;
}

- (BOOL)hasObjectForKey:(NSString*)key {
    return [[_data allValues] containsObject:key];
}

- (BOOL)boolForKey:(NSString*)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]]) {
        return [object boolValue];
    }
    return NO;
}

- (void)setBool:(BOOL)value forKey:(NSString*)key {
    [_data setObject:@(value) forKey:key];
}

- (double)doubleForKey:(NSString*)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]]) {
        return [object doubleValue];
    }
    return 0.0f;
}

- (void)setDouble:(double)value forKey:(NSString*)key {
    [_data setObject:@(value) forKey:key];
}

- (NSInteger)integerForKey:(NSString*)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]]) {
        return [object doubleValue];
    }
    return 0;
}

- (void)setInteger:(NSInteger)value forKey:(NSString*)key {
    [_data setObject:@(value) forKey:key];
}

- (float)floatForKey:(NSString*)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSNumber class]]) {
        return [object doubleValue];
    }
    return 0.0f;
}

- (void)setFloat:(float)value forKey:(NSString*)key {
    [_data setObject:@(value) forKey:key];
}

- (NSString*)stringForKey:(NSString*)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }
    return nil;
}

- (NSData*)dataForKey:(NSString*)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSData class]]) {
        return object;
    }
    return nil;
}

- (NSArray *)arrayForKey:(NSString *)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    }
    return nil;
}

- (NSURL *)URLForKey:(NSString *)key {
    id object = [_data objectForKey:key];
    if ([object isKindOfClass:[NSURL class]]) {
        return object;
    }
    return nil;
}

- (id)objectForKey:(NSString*)key {
    return [_data objectForKey:key];
}

- (void)setObject:(id)object forKey:(NSString*)key {
    [_data setObject:object forKey:key];
}

- (void)removeObjectForKey:(NSString*)key {
    [_data removeObjectForKey:key];
}

- (void)removeObjectsForKeys:(NSArray<NSString *> *)keys {
    [_data removeObjectsForKeys:keys];
}

@end
