//
//  CSCache.h
//  CocoaService-framework
//
//  Created by 吴云海 on 2018/10/18.
//  Copyright © 2018 吴云海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSService.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSString *CSCacheServiceId;
FOUNDATION_EXPORT CSCacheServiceId const CSCacheServiceIdKeychain;
FOUNDATION_EXPORT CSCacheServiceId const CSCacheServiceIdUserDefaults;
FOUNDATION_EXPORT CSCacheServiceId const CSCacheServiceIdMemorySafe;

@protocol CSCache <CSService>

/*
 是否存在key
 */
- (BOOL)hasObjectForKey:(NSString*)key;

/*
 获取bool类型数据
 非NSNumber 返回NO
 */
- (BOOL)boolForKey:(NSString*)key;

/*
 设置bool类型数据
 */
- (void)setBool:(BOOL)value forKey:(NSString*)key;

/*
 非NSNumber 返回0.0f
 */
- (double)doubleForKey:(NSString*)key;

- (void)setDouble:(double)value forKey:(NSString*)key;

/*
 非NSNumber 返回0.0f
*/
- (NSInteger)integerForKey:(NSString*)key;

- (void)setInteger:(NSInteger)value forKey:(NSString*)key;

/*
非NSNumber 返回0.0f
*/
- (float)floatForKey:(NSString*)key;

- (void)setFloat:(float)value forKey:(NSString*)key;

/*
 获取字符串数据
 非NSString 返回nil
 */
- (NSString* _Nullable)stringForKey:(NSString*)key;

/*
 返回NSData数据
 非NSData 返回nil
 */
- (NSData* _Nullable)dataForKey:(NSString*)key;

/*
 获取array
 非NSArray 返回nil
 */
- (NSArray* _Nullable)arrayForKey:(NSString*)key;

/*
 获取NSURL
 非NSURL 返回nil
 */
- (NSURL* _Nullable)URLForKey:(NSString*)key;

/*
 获取对象值
 */
- (id _Nullable)objectForKey:(NSString*)key;

- (void)setObject:(id)value forKey:(NSString*)key;

/*
 移除key
 */
- (void)removeObjectForKey:(NSString*)key;

/*
 移除多个key
 */
- (void)removeObjectsForKeys:(NSArray<NSString*>*)keys;

@end

NS_ASSUME_NONNULL_END
