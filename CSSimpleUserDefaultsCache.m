//
//  CSSimpleUserDefaultsCache.m
//  CocoaService-example
//
//  Created by 吴云海 on 2020/1/10.
//  Copyright © 2020 wuyunhai. All rights reserved.
//

#import "CSSimpleUserDefaultsCache.h"
#import "CSAnnotation.h"

CSCacheServiceId const CSCacheServiceIdUserDefaults = @"CacheServiceIdUserDefaults";

@interface CSSimpleUserDefaultsCache ()

@end

@CSService(CSCache, CSSimpleUserDefaultsCache)
@implementation CSSimpleUserDefaultsCache

- (id)copy {
    return self;
}

- (id)mutableCopy {
    return self;
}

#pragma mark CSCache
+ (BOOL)hasSingleton {
    return YES;
}

+ (id)sharedInstance {
    static CSSimpleUserDefaultsCache *sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [[CSSimpleUserDefaultsCache alloc] init];
    });
    return sharedObject;
}

+ (NSString *)uniqueId {
    return CSCacheServiceIdUserDefaults;
}

- (BOOL)hasObjectForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }
    return NO;
}

- (BOOL)boolForKey:(NSString*)key {
    if (key) {
        [[NSUserDefaults standardUserDefaults] boolForKey:key];
    }
    return NO;
}

- (void)setBool:(BOOL)value forKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (double)doubleForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] doubleForKey:key];
    }
    return 0.0f;
}

- (void)setDouble:(double)value forKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSInteger)integerForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] integerForKey:key];
    }
    return 0;
}

- (void)setInteger:(NSInteger)value forKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (float)floatForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] floatForKey:key];
    }
    return 0.0f;
}

- (void)setFloat:(float)value forKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setFloat:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*)stringForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] stringForKey:key];
    }
    return nil;
}

- (NSData*)dataForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] dataForKey:key];
    }
    return nil;
}

- (NSArray*)arrayForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] arrayForKey:key];
    }
    return nil;
}

- (NSURL*)URLForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] URLForKey:key];
    }
    return nil;
}

- (id)objectForKey:(NSString*)key {
    if (key) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    }
    return nil;
}

- (void)setObject:(id)value forKey:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)removeObjectForKey:(NSString*)key {
    if (key) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)removeObjectsForKeys:(NSArray<NSString*>*)keys {
    if ([keys count]) {
        for (NSString *key in keys) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        }
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
