//
//  LdcUserDefalutPlistManager.h
//  LDCKvo
//
//  Created by issuser on 2019/5/23.
//  Copyright © 2019 peanut. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LdcUserDefalutPlistManager : NSObject

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

@end

NS_ASSUME_NONNULL_END
