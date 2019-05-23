//
//  LDCUserDefaultCacheManager.h
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LDCUserDefaultCacheManager : NSObject

//cache是一个单例 单例里面有一个字典，这个字典一直存在，可以理解成是一个么默认的。
/**
 * 读操作的时候，先从cahe里查找，看是否有值，有，直接读出来，无，从plist文件里面读取。
 * 写操作的时候，先写入到缓存里，根据时间戳，过一段时间，再写到plist文件中。
 * 10万次操作 NSUserDefault 和  plist对比
 * 个人感觉
    写入操作对比  10万个 读取plist 100ms 10万个读取userDefault 1ms   （读取也是先从缓存读，缓存内没有，在从plist文件里面读取）
    读取操作对比  10万个 写入plist 1ms   10万个写入userDefault 100ms (先写入缓存，每隔一段时间，在写入到plist)
 */
/*
 */

//写入
- (void)setLdcValue:(id)value forKey:(NSString *)key;
//删除
- (void)removeLdcValueForKey:(NSString *)key;
//读取
- (id)ldcValueForKey:(NSString *)key;
//修改
- (void)modifiValue:(id)value ForKey:(NSString *)key;
//全部删除清空
- (void)resetLdcUserDefault;
//同步
- (void)synchronsize;


@end

NS_ASSUME_NONNULL_END
